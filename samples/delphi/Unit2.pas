unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ValEdit, Platius_Service_Api_Front_v2_Client_TLB;

type
  TfrmNotifications = class(TForm)
    vleData: TValueListEditor;
    procedure FormActivate(Sender: TObject);
  private
    i_notificationCollection: INotificationCollection;
    { Private declarations }
  public
    class procedure ShowInformation(notifications: INotificationCollection);
  end;

var
  frmNotifications: TfrmNotifications;

implementation

{$R *.dfm}

class procedure TfrmNotifications.ShowInformation(notifications: INotificationCollection);
var
  frm : TfrmNotifications;
begin
  frm := TfrmNotifications.Create(nil);
  frm.i_notificationCollection := notifications;
  frm.ShowModal;
end;

procedure TfrmNotifications.FormActivate(Sender: TObject);
var
  i: Integer;
  i_notification : INotification;
begin
  if i_notificationCollection <> nil then
  begin
    for i := 0 to i_notificationCollection.Count - 1 do
    begin
      i_notification := i_notificationCollection.Get(i);
      vleData.InsertRow(i_notification.Id, i_notification.Message, true);
    end;
    i_notificationCollection := nil;
  end;
end;

end.
