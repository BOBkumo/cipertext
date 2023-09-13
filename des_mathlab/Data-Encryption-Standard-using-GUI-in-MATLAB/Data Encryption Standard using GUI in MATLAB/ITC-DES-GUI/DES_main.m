function varargout = DES_main(varargin)
% DES_MAIN MATLAB code for DES_main.fig
%      DES_MAIN, by itself, creates a new DES_MAIN or raises the existing
%      singleton*.
%
%      H = DES_MAIN returns the handle to a new DES_MAIN or the handle to
%      the existing singleton*.
%
%      DES_MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DES_MAIN.M with the given input arguments.
%
%      DES_MAIN('Property','Value',...) creates a new DES_MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DES_main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DES_main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DES_main

% Last Modified by GUIDE v2.5 28-Feb-2018 14:55:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DES_main_OpeningFcn, ...
                   'gui_OutputFcn',  @DES_main_OutputFcn, ...
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


% --- Executes just before DES_main is made visible.
function DES_main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DES_main (see VARARGIN)

% Choose default command line output for DES_main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DES_main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DES_main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function hexinput_Callback(hObject, eventdata, handles)
% hObject    handle to hexinput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hexinput as text
%        str2double(get(hObject,'String')) returns contents of hexinput as a double


% --- Executes during object creation, after setting all properties.
function hexinput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hexinput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function keyinput_Callback(hObject, eventdata, handles)
% hObject    handle to keyinput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of keyinput as text
%        str2double(get(hObject,'String')) returns contents of keyinput as a double


% --- Executes during object creation, after setting all properties.
function keyinput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to keyinput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function hexoutput_Callback(hObject, eventdata, handles)
% hObject    handle to hexoutput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hexoutput as text
%        str2double(get(hObject,'String')) returns contents of hexoutput as a double


% --- Executes during object creation, after setting all properties.
function hexoutput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hexoutput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_done.
function btn_done_Callback(hObject, eventdata, handles)
% hObject    handle to btn_done (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% INPUT
a =  get(handles.hexinput,'String');
b =  get(handles.keyinput,'String');
c = hexToBinaryVector(a,64);
org_key = hexToBinaryVector(b,64);
%% Initial Permutation
c = IP(c);
set(handles.IP_cipher,'String', binaryVectorToHex(c));
%% Round
key_round_bit = KEY_GEN(org_key);

check_decryption = get(handles.checkbox_decryption,'value');
if check_decryption == 1
    key_round_bit = flipud(key_round_bit);
end

key_round = binaryVectorToHex(key_round_bit);
set(handles.textbox_key_round_1,'String', key_round(1,:));
set(handles.textbox_key_round_2,'String', key_round(2,:));
set(handles.textbox_key_round_3,'String', key_round(3,:));
set(handles.textbox_key_round_4,'String', key_round(4,:));
set(handles.textbox_key_round_5,'String', key_round(5,:));
set(handles.textbox_key_round_6,'String', key_round(6,:));
set(handles.textbox_key_round_7,'String', key_round(7,:));
set(handles.textbox_key_round_8,'String', key_round(8,:));
set(handles.textbox_key_round_9,'String', key_round(9,:));
set(handles.textbox_key_round_10,'String', key_round(10,:));
set(handles.textbox_key_round_11,'String', key_round(11,:));
set(handles.textbox_key_round_12,'String', key_round(12,:));
set(handles.textbox_key_round_13,'String', key_round(13,:));
set(handles.textbox_key_round_14,'String', key_round(14,:));
set(handles.textbox_key_round_15,'String', key_round(15,:));
set(handles.textbox_key_round_16,'String', key_round(16,:));

cipher_round = [];
for i = 1:16
    c = ROUND(c,key_round_bit(i,:));
    cipher_round = [cipher_round; binaryVectorToHex(c)];
end
disp(cipher_round);
set(handles.textbox_cipher_round_1,'String', cipher_round(1,:));
set(handles.textbox_cipher_round_2,'String', cipher_round(2,:));
set(handles.textbox_cipher_round_3,'String', cipher_round(3,:));
set(handles.textbox_cipher_round_4,'String', cipher_round(4,:));
set(handles.textbox_cipher_round_5,'String', cipher_round(5,:));
set(handles.textbox_cipher_round_6,'String', cipher_round(6,:));
set(handles.textbox_cipher_round_7,'String', cipher_round(7,:));
set(handles.textbox_cipher_round_8,'String', cipher_round(8,:));
set(handles.textbox_cipher_round_9,'String', cipher_round(9,:));
set(handles.textbox_cipher_round_10,'String', cipher_round(10,:));
set(handles.textbox_cipher_round_11,'String', cipher_round(11,:));
set(handles.textbox_cipher_round_12,'String', cipher_round(12,:));
set(handles.textbox_cipher_round_13,'String', cipher_round(13,:));
set(handles.textbox_cipher_round_14,'String', cipher_round(14,:));
set(handles.textbox_cipher_round_15,'String', cipher_round(15,:));
c = [ c(1,33:64) c(1,1:32) ]; % rotate left right after round 16
set(handles.textbox_cipher_round_16,'String', cipher_round(16,:));
%% Final Permutation
c = FP(c);
set(handles.FP_cipher,'String', binaryVectorToHex(c));
%%


%% ciperText
d = binaryVectorToHex(c);
set(handles.hexoutput,'String', d);



function IP_cipher_Callback(hObject, eventdata, handles)
% hObject    handle to IP_cipher (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of IP_cipher as text
%        str2double(get(hObject,'String')) returns contents of IP_cipher as a double


% --- Executes during object creation, after setting all properties.
function IP_cipher_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IP_cipher (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function FP_cipher_Callback(hObject, eventdata, handles)
% hObject    handle to FP_cipher (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FP_cipher as text
%        str2double(get(hObject,'String')) returns contents of FP_cipher as a double


% --- Executes during object creation, after setting all properties.
function FP_cipher_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FP_cipher (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textbox_cipher_round_1_Callback(hObject, eventdata, handles)
% hObject    handle to textbox_cipher_round_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textbox_cipher_round_1 as text
%        str2double(get(hObject,'String')) returns contents of textbox_cipher_round_1 as a double


% --- Executes during object creation, after setting all properties.
function textbox_cipher_round_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textbox_cipher_round_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textbox_cipher_round_2_Callback(hObject, eventdata, handles)
% hObject    handle to textbox_cipher_round_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textbox_cipher_round_2 as text
%        str2double(get(hObject,'String')) returns contents of textbox_cipher_round_2 as a double


% --- Executes during object creation, after setting all properties.
function textbox_cipher_round_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textbox_cipher_round_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textbox_cipher_round_3_Callback(hObject, eventdata, handles)
% hObject    handle to textbox_cipher_round_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textbox_cipher_round_3 as text
%        str2double(get(hObject,'String')) returns contents of textbox_cipher_round_3 as a double


% --- Executes during object creation, after setting all properties.
function textbox_cipher_round_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textbox_cipher_round_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textbox_cipher_round_4_Callback(hObject, eventdata, handles)
% hObject    handle to textbox_cipher_round_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textbox_cipher_round_4 as text
%        str2double(get(hObject,'String')) returns contents of textbox_cipher_round_4 as a double


% --- Executes during object creation, after setting all properties.
function textbox_cipher_round_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textbox_cipher_round_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textbox_cipher_round_5_Callback(hObject, eventdata, handles)
% hObject    handle to textbox_cipher_round_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textbox_cipher_round_5 as text
%        str2double(get(hObject,'String')) returns contents of textbox_cipher_round_5 as a double


% --- Executes during object creation, after setting all properties.
function textbox_cipher_round_5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textbox_cipher_round_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textbox_cipher_round_6_Callback(hObject, eventdata, handles)
% hObject    handle to textbox_cipher_round_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textbox_cipher_round_6 as text
%        str2double(get(hObject,'String')) returns contents of textbox_cipher_round_6 as a double


% --- Executes during object creation, after setting all properties.
function textbox_cipher_round_6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textbox_cipher_round_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textbox_cipher_round_7_Callback(hObject, eventdata, handles)
% hObject    handle to textbox_cipher_round_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textbox_cipher_round_7 as text
%        str2double(get(hObject,'String')) returns contents of textbox_cipher_round_7 as a double


% --- Executes during object creation, after setting all properties.
function textbox_cipher_round_7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textbox_cipher_round_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textbox_cipher_round_8_Callback(hObject, eventdata, handles)
% hObject    handle to textbox_cipher_round_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textbox_cipher_round_8 as text
%        str2double(get(hObject,'String')) returns contents of textbox_cipher_round_8 as a double


% --- Executes during object creation, after setting all properties.
function textbox_cipher_round_8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textbox_cipher_round_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textbox_cipher_round_9_Callback(hObject, eventdata, handles)
% hObject    handle to textbox_cipher_round_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textbox_cipher_round_9 as text
%        str2double(get(hObject,'String')) returns contents of textbox_cipher_round_9 as a double


% --- Executes during object creation, after setting all properties.
function textbox_cipher_round_9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textbox_cipher_round_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textbox_cipher_round_10_Callback(hObject, eventdata, handles)
% hObject    handle to textbox_cipher_round_10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textbox_cipher_round_10 as text
%        str2double(get(hObject,'String')) returns contents of textbox_cipher_round_10 as a double


% --- Executes during object creation, after setting all properties.
function textbox_cipher_round_10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textbox_cipher_round_10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textbox_cipher_round_11_Callback(hObject, eventdata, handles)
% hObject    handle to textbox_cipher_round_11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textbox_cipher_round_11 as text
%        str2double(get(hObject,'String')) returns contents of textbox_cipher_round_11 as a double


% --- Executes during object creation, after setting all properties.
function textbox_cipher_round_11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textbox_cipher_round_11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textbox_cipher_round_12_Callback(hObject, eventdata, handles)
% hObject    handle to textbox_cipher_round_12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textbox_cipher_round_12 as text
%        str2double(get(hObject,'String')) returns contents of textbox_cipher_round_12 as a double


% --- Executes during object creation, after setting all properties.
function textbox_cipher_round_12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textbox_cipher_round_12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textbox_cipher_round_13_Callback(~, eventdata, handles)
% hObject    handle to textbox_cipher_round_13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textbox_cipher_round_13 as text
%        str2double(get(hObject,'String')) returns contents of textbox_cipher_round_13 as a double


% --- Executes during object creation, after setting all properties.
function textbox_cipher_round_13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textbox_cipher_round_13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textbox_cipher_round_14_Callback(hObject, eventdata, handles)
% hObject    handle to textbox_cipher_round_14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textbox_cipher_round_14 as text
%        str2double(get(hObject,'String')) returns contents of textbox_cipher_round_14 as a double


% --- Executes during object creation, after setting all properties.
function textbox_cipher_round_14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textbox_cipher_round_14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textbox_cipher_round_15_Callback(hObject, eventdata, handles)
% hObject    handle to textbox_cipher_round_15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textbox_cipher_round_15 as text
%        str2double(get(hObject,'String')) returns contents of textbox_cipher_round_15 as a double


% --- Executes during object creation, after setting all properties.
function textbox_cipher_round_15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textbox_cipher_round_15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textbox_cipher_round_16_Callback(hObject, eventdata, handles)
% hObject    handle to textbox_cipher_round_16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textbox_cipher_round_16 as text
%        str2double(get(hObject,'String')) returns contents of textbox_cipher_round_16 as a double


% --- Executes during object creation, after setting all properties.
function textbox_cipher_round_16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textbox_cipher_round_16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textbox_key_round_1_Callback(hObject, eventdata, handles)
% hObject    handle to textbox_key_round_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textbox_key_round_1 as text
%        str2double(get(hObject,'String')) returns contents of textbox_key_round_1 as a double


% --- Executes during object creation, after setting all properties.
function textbox_key_round_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textbox_key_round_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textbox_key_round_2_Callback(hObject, eventdata, handles)
% hObject    handle to textbox_key_round_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textbox_key_round_2 as text
%        str2double(get(hObject,'String')) returns contents of textbox_key_round_2 as a double


% --- Executes during object creation, after setting all properties.
function textbox_key_round_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textbox_key_round_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textbox_key_round_3_Callback(hObject, eventdata, handles)
% hObject    handle to textbox_key_round_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textbox_key_round_3 as text
%        str2double(get(hObject,'String')) returns contents of textbox_key_round_3 as a double


% --- Executes during object creation, after setting all properties.
function textbox_key_round_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textbox_key_round_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textbox_key_round_4_Callback(hObject, eventdata, handles)
% hObject    handle to textbox_key_round_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textbox_key_round_4 as text
%        str2double(get(hObject,'String')) returns contents of textbox_key_round_4 as a double


% --- Executes during object creation, after setting all properties.
function textbox_key_round_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textbox_key_round_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textbox_key_round_5_Callback(hObject, eventdata, handles)
% hObject    handle to textbox_key_round_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textbox_key_round_5 as text
%        str2double(get(hObject,'String')) returns contents of textbox_key_round_5 as a double


% --- Executes during object creation, after setting all properties.
function textbox_key_round_5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textbox_key_round_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textbox_key_round_6_Callback(hObject, eventdata, handles)
% hObject    handle to textbox_key_round_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textbox_key_round_6 as text
%        str2double(get(hObject,'String')) returns contents of textbox_key_round_6 as a double


% --- Executes during object creation, after setting all properties.
function textbox_key_round_6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textbox_key_round_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textbox_key_round_7_Callback(hObject, eventdata, handles)
% hObject    handle to textbox_key_round_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textbox_key_round_7 as text
%        str2double(get(hObject,'String')) returns contents of textbox_key_round_7 as a double


% --- Executes during object creation, after setting all properties.
function textbox_key_round_7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textbox_key_round_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textbox_key_round_8_Callback(hObject, eventdata, handles)
% hObject    handle to textbox_key_round_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textbox_key_round_8 as text
%        str2double(get(hObject,'String')) returns contents of textbox_key_round_8 as a double


% --- Executes during object creation, after setting all properties.
function textbox_key_round_8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textbox_key_round_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textbox_key_round_9_Callback(hObject, eventdata, handles)
% hObject    handle to textbox_key_round_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textbox_key_round_9 as text
%        str2double(get(hObject,'String')) returns contents of textbox_key_round_9 as a double


% --- Executes during object creation, after setting all properties.
function textbox_key_round_9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textbox_key_round_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textbox_key_round_10_Callback(hObject, eventdata, handles)
% hObject    handle to textbox_key_round_10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textbox_key_round_10 as text
%        str2double(get(hObject,'String')) returns contents of textbox_key_round_10 as a double


% --- Executes during object creation, after setting all properties.
function textbox_key_round_10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textbox_key_round_10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textbox_key_round_11_Callback(hObject, eventdata, handles)
% hObject    handle to textbox_key_round_11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textbox_key_round_11 as text
%        str2double(get(hObject,'String')) returns contents of textbox_key_round_11 as a double


% --- Executes during object creation, after setting all properties.
function textbox_key_round_11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textbox_key_round_11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textbox_key_round_12_Callback(hObject, eventdata, handles)
% hObject    handle to textbox_key_round_12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textbox_key_round_12 as text
%        str2double(get(hObject,'String')) returns contents of textbox_key_round_12 as a double


% --- Executes during object creation, after setting all properties.
function textbox_key_round_12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textbox_key_round_12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textbox_key_round_13_Callback(hObject, eventdata, handles)
% hObject    handle to textbox_key_round_13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textbox_key_round_13 as text
%        str2double(get(hObject,'String')) returns contents of textbox_key_round_13 as a double


% --- Executes during object creation, after setting all properties.
function textbox_key_round_13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textbox_key_round_13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textbox_key_round_16_Callback(hObject, eventdata, handles)
% hObject    handle to textbox_key_round_16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textbox_key_round_16 as text
%        str2double(get(hObject,'String')) returns contents of textbox_key_round_16 as a double


% --- Executes during object creation, after setting all properties.
function textbox_key_round_16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textbox_key_round_16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textbox_key_round_15_Callback(hObject, eventdata, handles)
% hObject    handle to textbox_key_round_15 (see GCBO) eventdata  reserved - to be
% defined in a future version of MATLAB handles    structure with handles
% and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textbox_key_round_15 as text
%        str2double(get(hObject,'String')) returns contents of textbox_key_round_15 as a
%        double


% --- Executes during object creation, after setting all properties.
function textbox_key_round_15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textbox_key_round_15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textbox_key_round_14_Callback(hObject, eventdata, handles)
% hObject    handle to textbox_key_round_14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textbox_key_round_14 as text
%        str2double(get(hObject,'String')) returns contents of textbox_key_round_14 as a double


% --- Executes during object creation, after setting all properties.
function textbox_key_round_14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textbox_key_round_14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton_encryption.
function radiobutton_encryption_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_encryption (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_encryption


% --- Executes on button press in radiobutton_decryption.
function radiobutton_decryption_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_decryption (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_decryption


% --- Executes on button press in checkbox_decryption.
function checkbox_decryption_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_decryption (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_decryption
