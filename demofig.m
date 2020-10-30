function varargout = demofig(varargin)
%DEMOFIG MATLAB code file for demofig.fig
%      DEMOFIG, by itself, creates a new DEMOFIG or raises the existing
%      singleton*.
%
%      H = DEMOFIG returns the handle to a new DEMOFIG or the handle to
%      the existing singleton*.
%
%      DEMOFIG('Property','Value',...) creates a new DEMOFIG using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to demofig_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      DEMOFIG('CALLBACK') and DEMOFIG('CALLBACK',hObject,...) call the
%      local function named CALLBACK in DEMOFIG.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help demofig

% Last Modified by GUIDE v2.5 18-Oct-2020 01:17:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @demofig_OpeningFcn, ...
                   'gui_OutputFcn',  @demofig_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before demofig is made visible.
function demofig_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for demofig
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes demofig wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = demofig_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in addnoise.
function addnoise_Callback(hObject, eventdata, handles)
% hObject    handle to addnoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=handles.a

R=a(:,:,1);
G=a(:,:,2);
B=a(:,:,3);
R = imnoise(R,'salt & pepper', 0.12);
G = imnoise(G,'salt & pepper', 0.12);
B = imnoise(B,'salt & pepper', 0.12);
NoisyImage(:,:,1)=R;
NoisyImage(:,:,2)=G;
NoisyImage(:,:,3)=B;
imwrite(NoisyImage,'noisy.png');
axes(handles.axes2);imshow(NoisyImage);
handles.NoisyImage=NoisyImage;
% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in applyfilter.
function applyfilter_Callback(hObject, eventdata, handles)
% hObject    handle to applyfilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NoisyImage=handles.NoisyImage;

R=NoisyImage(:,:,1);
G=NoisyImage(:,:,2);
B=NoisyImage(:,:,3);
R=medfilt2(R,[5 5]);
G=medfilt2(G,[5 5])
B=medfilt2(B,[5 5])
FilteredImage(:,:,1)=R;
FilteredImage(:,:,2)=G;
FilteredImage(:,:,3)=B;
axes(handles.axes3);
imshow(FilteredImage)

% --- Executes on button press in selectimage.
function selectimage_Callback(hObject, eventdata, handles)
% hObject    handle to selectimage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile('*.*', 'Pick a MATLAB code file');
    if isequal(filename,0) || isequal(pathname,0)
       warndlg('User pressed cancel')
    else
       a=imread(strcat(pathname,filename));
       axes(handles.axes1);
       imshow(a);
       handles.a=a;
    end
    guidata(hObject, handles);
