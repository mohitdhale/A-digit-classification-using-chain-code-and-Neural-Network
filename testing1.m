function [ B ] = testing1(rgbimage2)
rgbimage=imread(rgbimage2);
N=zeros(100,1);
% [rows, columns, numberOfColorChannels] = size(rgbimage2);

% if numberOfColorChannels > 1
%     grayImage = rgbimage2(:, :, 2);
% else 	grayImage =rgbimage2;
% end
if size(rgbimage,3)>1
    grayImage = rgb2gray(rgbimage)
else
    grayImage=rgbimage;
end
grayImage=imresize(grayImage,[32 32]);
%binary image


% title('Binary Scale Image');
binaryImage=grayImage>200;
binaryimage=~binaryImage;
%title('bridge Scale Image');
t=bwmorph(binaryimage,'dilate');
% title('thinning Scale Image');
bw=bwmorph(t,'thin',Inf);
[m,n]=size(bw);
maxi=max(m,n);
%to get boundary and strating point
temp=zeros(maxi,2);
g=1;h=1;
for i=1:m
    for j=1:n
        if bw(i,j)==1
            temp(g,1)=i;
            temp(h,2)=j;
            g=g+1;
            h=h+1;
        end
    end
end
p=temp(1,1);
q=temp(1,2);
bound_p=bwtraceboundary(bw,[p q],'E',8);
[f, h]=size(bound_p);
%to store delta x and delta y
deltax=zeros(f-1,2);
% deltay=zeros(m-1,1);
x_cl=bound_p(:,1);
y_cl=bound_p(:,2);
chainco=zeros(f-1,3);% chaincode matrix
%for computing chaincode
for i=1:f-1
    deltax(i,1)=x_cl(i,1)-x_cl(i+1,1);% delta x
    
end

for i=1:f-1
    deltax(i,2)=y_cl(i,1)-y_cl(i+1,1);%delta y as a second column of deltax array
    
end
%display('the delta x and delta y is');
%display(deltax');
for i=1:f-1
    if deltax(i,1)==0 &&deltax(i,2)==(-1)   % depending upon the value of delta x and
        chainco(i,1)=0;                        %delta y chaincode is calculated.
    elseif deltax(i,1)==1 && deltax(i,2)==(-1)
        chainco(i,1)=1;
    elseif deltax(i,1)==1 && deltax(i,2)==0
        chainco(i,1)=2;
    elseif   deltax(i,1)==1 && deltax(i,2)==1
        chainco(i,1)=3;
    elseif deltax(i,1)==0 && deltax(i,2)==1
        chainco(i,1)=4;
    elseif deltax(i,1)==(-1) && deltax(i,2)==1
        chainco(i,1)=5;
    elseif deltax(i,1)==(-1) && deltax(i,2)==0
        chainco(i,1)=6;
    elseif deltax(i,1)==(-1) && deltax(i,2)==(-1)
        chainco(i,1)=7;
    end
end

a=chainco(:,1);
h=length(a)-1;
k=1;
for i=1:h
    if a(i)==a(i+1)
        N(k)=a(i);
    else
        N(k+1)=a(i+1);
        k=k+1;
    end
    
    B=N;
end

end

