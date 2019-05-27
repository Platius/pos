set startdir=%~dp0%

sc delete plazius.cury
sc delete Agents.Tsup.LogososApp.exe
sc delete PlatiusClientHost
sc delete plazius.rpos
sc delete plazius.logosos
sc delete Plazius.Rpos
sc delete Pos.Api.v2.Wrapper.Service.Host

sc stop PlaziusClientHost
sc delete PlaziusClientHost

sc create PlaziusClientHost binpath= "%startdir%Agents.Pos.Rpos.App.exe" start= auto
 
sc start PlaziusClientHost