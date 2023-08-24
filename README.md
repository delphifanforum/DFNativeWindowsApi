<h1 align="center" id="title">DFNativeWindowsApi</h1>

<p id="description">DFNativeWindowsApi is a Delphi library that provides convenient access to various Native Windows API functions for Windows-based applications. These functions cover a range of system-level operations from displaying message boxes to interacting with the underlying system.</p>

  
  
<h2>🧐 Features</h2>

Here're some of the project's best features:

*   Show message boxes using Native Windows API (NtUserMessageBox).
*   Produce beep sounds at specific frequencies and durations.
*   Retrieve the system directory path.
*   Get the number of milliseconds since the system was started.
*   Obtain the current user's name.
*   Retrieve the identifier of the current thread.
*   Suspend the execution of the current thread for a specified time.

<h2>🛠️ Installation Steps:</h2>

<p>1. Clone or download the repository to your local machine.</p>

<p>2. Open your Delphi IDE and load the project file.</p>

<p>3. Compile the project to generate the library file (`DFNativeWindowsApi.dll` or similar).</p>

<p>4. Include the library file in your Delphi projects to access the provided functionality.</p>


<h2>🛠️ Usage:</h2>

<p>1. Add the compiled library (`DFNativeWindowsApi.dll`) to your Delphi project.</p>
  
<p>2. Import the library unit in your code:</p>


```delphi
   uses
     DFNativeWindowsApi;
```
<p>You can then use the various class methods to access the Native Windows API functions. For example:</p>

```delphi
TDFNativeWindowsApi.ShowMessageBox('Hello, world!');
TDFNativeWindowsApi.Beep(1000, 200);
```

<h2>Notes</h2>
<p>The Native Windows API functions provided by this library are primarily intended for educational and experimental purposes. In most practical applications, using the standard Windows API functions is recommended due to better documentation and compatibility.
Care should be taken when working with Native API functions, as they can have system-wide implications if used incorrectly.</p>
