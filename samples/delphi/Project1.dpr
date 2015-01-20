program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  iikoNet_Service_Api_Front_v2_Client_TLB in 'iikoNet_Service_Api_Front_v2_Client_TLB.pas';

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.


