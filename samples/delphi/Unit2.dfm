object frmNotifications: TfrmNotifications
  Left = 202
  Top = 248
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Notifications'
  ClientHeight = 185
  ClientWidth = 742
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  DesignSize = (
    742
    185)
  PixelsPerInch = 96
  TextHeight = 13
  object vleData: TValueListEditor
    Left = 8
    Top = 8
    Width = 724
    Height = 170
    Anchors = [akLeft, akTop, akRight, akBottom]
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goThumbTracking]
    TabOrder = 0
    ColWidths = (
      150
      568)
  end
end
