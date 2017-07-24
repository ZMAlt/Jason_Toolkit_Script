function varargout = VIETNAM_TRAINING(varargin)
% VIETNAM_TRAINING MATLAB code for VIETNAM_TRAINING.fig
%      VIETNAM_TRAINING, by itself, creates a new VIETNAM_TRAINING or raises the existing
%      singleton*.
%
%      H = VIETNAM_TRAINING returns the handle to a new VIETNAM_TRAINING or the handle to
%      the existing singleton*.
%
%      VIETNAM_TRAINING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VIETNAM_TRAINING.M with the given input arguments.
%
%      VIETNAM_TRAINING('Property','Value',...) creates a new VIETNAM_TRAINING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before VIETNAM_TRAINING_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to VIETNAM_TRAINING_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help VIETNAM_TRAINING

% Last Modified by GUIDE v2.5 27-Mar-2017 14:15:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @VIETNAM_TRAINING_OpeningFcn, ...
                   'gui_OutputFcn',  @VIETNAM_TRAINING_OutputFcn, ...
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


% --- Executes just before VIETNAM_TRAINING is made visible.
function VIETNAM_TRAINING_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to VIETNAM_TRAINING (see VARARGIN)

% Choose default command line output for VIETNAM_TRAINING
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
% UIWAIT makes VIETNAM_TRAINING wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = VIETNAM_TRAINING_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in extractNetCDF_J2.
function extractNetCDF_J2_Callback(hObject, eventdata, handles)
% hObject    handle to extractNetCDF_J2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CycFolder = uigetdir(pwd,'Directory to downloaded Cycles');
copyNETCDF
x = inputdlg({'Output File Suffix Name','Pass Number','Minimum Latitude',...
    'Maximum Latitude' }, 'Info', [1 25; 1 25; 1 25;1 25]); 

jason2_gdr_info(x{2},[str2num(x{3}),str2num(x{4})],strcat(x{1},'_',x{3},'_',x{4}))


% --- Executes on button press in timeseries_J2.
function timeseries_J2_Callback(hObject, eventdata, handles)
% hObject    handle to timeseries_J2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

j2_SingleProcess_TimeSeries


% --- Executes on button press in ftpdownload_J2.
function ftpdownload_J2_Callback(hObject, eventdata, handles)
% hObject    handle to ftpdownload_J2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
j2_FtpDownload


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over text2.
function text2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function uh_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate uh
imshow('UH.png')


% --- Executes during object creation, after setting all properties.
function uw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate uw
imshow('UW.jpg')


% --- Executes on button press in extractNetCDF_J3.
function extractNetCDF_J3_Callback(hObject, eventdata, handles)
% hObject    handle to extractNetCDF_J3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CycFolder = uigetdir(pwd,'Directory to downloaded Cycles');
copyNETCDF
x = inputdlg({'Output File Suffix Name','Pass Number','Minimum Latitude',...
    'Maximum Latitude' }, 'Info', [1 25; 1 25; 1 25;1 25]); 

jason3_gdr_info(x{2},[str2num(x{3}),str2num(x{4})],strcat(x{1},'_',x{3},'_',x{4}))



% --- Executes on button press in timeseries_J3.
function timeseries_J3_Callback(hObject, eventdata, handles)
% hObject    handle to timeseries_J3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

j3_SingleProcess_TimeSeries

% --- Executes on button press in ftpdownload_J3.
function ftpdownload_J3_Callback(hObject, eventdata, handles)
% hObject    handle to ftpdownload_J3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

j3_FtpDownload


% --- Executes during object creation, after setting all properties.
function axes4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes4
axes(hObject)
imshow('UH.png');


% --- Executes during object creation, after setting all properties.
function axes5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes5
axes(hObject)
imshow('UW.jpg');
