function varargout = chain_and_NN(varargin)
% CHAIN_AND_NN MATLAB code for chain_and_NN.fig
%      CHAIN_AND_NN, by itself, creates a new CHAIN_AND_NN or raises the existing
%      singleton*.
%
%      H = CHAIN_AND_NN returns the handle to a new CHAIN_AND_NN or the handle to
%      the existing singleton*.
%
%      CHAIN_AND_NN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAIN_AND_NN.M with the given input arguments.
%
%      CHAIN_AND_NN('Property','Value',...) creates a new CHAIN_AND_NN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chain_and_NN_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chain_and_NN_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chain_and_NN

% Last Modified by GUIDE v2.5 27-Mar-2018 16:57:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chain_and_NN_OpeningFcn, ...
                   'gui_OutputFcn',  @chain_and_NN_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before chain_and_NN is made visible.
function chain_and_NN_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to chain_and_NN (see VARARGIN)

% Choose default command line output for chain_and_NN
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes chain_and_NN wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = chain_and_NN_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,path]=uigetfile({'*.bmp'},'File Selector');
myImage=strcat(path, FileName);
handles.output=gui_chainco(myImage);
handles.myImage=strcat(path, FileName);

axes(handles.axes1);
% myimg=imread(myImage);
imshow(handles.myImage);
% output=training_testing_final(myImage);
% set(handles.edit1,'string',handles.myImage);
set(handles.edit1,'string',handles.output);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
