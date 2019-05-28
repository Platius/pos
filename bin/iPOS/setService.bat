set servicename=plazius.ipos
set exename = Agents.Pos.Ipos.App.exe
set startdir=%~dp0%
echo.startdir=%startdir%
echo.servicename =%servicename%

sc delete plazius.cury
sc delete Agents.Tsup.LogososApp.exe
sc delete %servicename%

echo Installing service...
sc create %servicename% binpath= "%startdir%Agents.Pos.Ipos.App.exe" start= auto
echo Installing service complete
 
echo starting the service...
sc start %servicename%
echo service starting complete
 
pause
 	 	 	 	 	 	 
