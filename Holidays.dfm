object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 527
  ClientWidth = 802
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl: TLabel
    Left = 56
    Top = 8
    Width = 698
    Height = 42
    Caption = 'Holidays timetable for ____-____ school year'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl0: TLabel
    Left = 745
    Top = 492
    Width = 49
    Height = 13
    Caption = 'Dimini Inc.'
  end
  object edt: TEdit
    Left = 8
    Top = 482
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Enter school year'
  end
  object sgd: TStringGrid
    Left = 8
    Top = 56
    Width = 777
    Height = 401
    TabOrder = 1
  end
  object btn: TButton
    Left = 368
    Top = 480
    Width = 75
    Height = 25
    Caption = 'Execute'
    TabOrder = 2
    OnClick = btnClick
  end
end
