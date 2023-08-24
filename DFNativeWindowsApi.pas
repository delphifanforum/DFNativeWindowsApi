unit DFNativeWindowsApi;

interface

uses
  Windows;

type
  TDFNativeWindowsApi = class
  public
    class procedure ShowMessageBox(const Text: string);
    class procedure Beep(const Frequency, Duration: DWORD);
    class function GetSystemDirectory: string;
    class function GetTickCount64: UInt64;
    class function GetUserName: string;
    class function GetCurrentThreadId: DWORD;
    class procedure Sleep(const Milliseconds: DWORD);
  end;

implementation

const
  MB_OK = $00000000;
  MB_ICONINFORMATION = $00000040;

type
  TNtUserMessageBox = function(hwnd: HWND; Text: PWideChar; Caption: PWideChar;
    uType: UINT; Parameters: ULONG_PTR): Longint; stdcall;

var
  NtUserMessageBox: TNtUserMessageBox = nil;

function LoadNtUserModule: Boolean;
var
  NtUserHandle: HMODULE;
begin
  NtUserHandle := GetModuleHandle('user32.dll');
  if NtUserHandle <> 0 then
  begin
    @NtUserMessageBox := GetProcAddress(NtUserHandle, 'NtUserMessageBox');
    Result := Assigned(NtUserMessageBox);
  end
  else
    Result := False;
end;

class procedure TDFNativeWindowsApi.ShowMessageBox(const Text: string);
begin
  if LoadNtUserModule and Assigned(NtUserMessageBox) then
  begin
    NtUserMessageBox(0, PWideChar(Text), 'Native API Message Box', MB_OK or MB_ICONINFORMATION, 0);
  end
  else
  begin
    // Fallback to MessageBox if Native API call fails
    MessageBox(0, PChar(Text), 'MessageBox', MB_OK or MB_ICONINFORMATION);
  end;
end;

class procedure TDFNativeWindowsApi.Beep(const Frequency, Duration: DWORD);
begin
  Beep(Frequency, Duration);
end;

class function TDFNativeWindowsApi.GetSystemDirectory: string;
var
  Buffer: array[0..MAX_PATH] of Char;
begin
  if GetSystemDirectory(Buffer, SizeOf(Buffer)) > 0 then
    Result := Buffer
  else
    Result := '';
end;

class function TDFNativeWindowsApi.GetTickCount64: UInt64;
begin
  Result := GetTickCount64;
end;

class function TDFNativeWindowsApi.GetUserName: string;
var
  Buffer: array[0..255] of Char;
  Size: DWORD;
begin
  Size := SizeOf(Buffer);
  if GetUserName(Buffer, Size) then
    Result := Buffer
  else
    Result := '';
end;

class function TDFNativeWindowsApi.GetCurrentThreadId: DWORD;
begin
  Result := GetCurrentThreadId;
end;

class procedure TDFNativeWindowsApi.Sleep(const Milliseconds: DWORD);
begin
  Sleep(Milliseconds);
end;

end.
