object Form1: TForm1
  Left = 192
  Top = 124
  Width = 306
  Height = 111
  ActiveControl = btnBasic
  Caption = 'Delphi 7'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object btnComplex: TButton
    Left = 144
    Top = 16
    Width = 121
    Height = 25
    Caption = 'ComplexWorkflow'
    TabOrder = 0
    OnClick = btnComplexClick
  end
  object btnBasic: TButton
    Left = 16
    Top = 16
    Width = 121
    Height = 25
    Caption = 'BasicWorkflow'
    TabOrder = 1
    OnClick = btnBasicClick
  end
  object btnGetNotifications: TButton
    Left = 16
    Top = 48
    Width = 121
    Height = 25
    Caption = 'GetNotifications'
    TabOrder = 2
    OnClick = btnGetNotificationsClick
  end
end
