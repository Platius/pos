rem if %PROCESSOR_ARCHITECTURE%==x86 (
  "%WINDIR%\Microsoft.NET\Framework\v4.0.30319\regasm.exe" Platius.Service.Api.Front.v2.Client.dll /codebase /unregister
rem ) else (
rem  "%WINDIR%\Microsoft.NET\Framework64\v4.0.30319\regasm.exe" Platius.Service.Api.Front.v2.Client.dll /codebase /unregister
rem )