object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'AMD GPU Info'
  ClientHeight = 190
  ClientWidth = 185
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lblTemp: TLabel
    Left = 8
    Top = 8
    Width = 30
    Height = 21
    AutoSize = False
    Caption = 'Temp:'
    Layout = tlCenter
  end
  object lblFan: TLabel
    Left = 8
    Top = 32
    Width = 30
    Height = 21
    AutoSize = False
    Caption = 'Fan:'
    Layout = tlCenter
  end
  object Label1: TLabel
    Left = 8
    Top = 104
    Width = 30
    Height = 21
    AutoSize = False
    Caption = 'Load:'
    Layout = tlCenter
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 30
    Height = 21
    AutoSize = False
    Caption = 'Clock:'
    Layout = tlCenter
  end
  object Label3: TLabel
    Left = 8
    Top = 80
    Width = 41
    Height = 21
    AutoSize = False
    Caption = 'Memory:'
    Layout = tlCenter
  end
  object btnGetInfo: TButton
    Left = 8
    Top = 128
    Width = 80
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    OnClick = btnGetInfoClick
  end
  object edTemp: TEdit
    Left = 56
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'n/a'
  end
  object edFan: TEdit
    Left = 56
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'n/a'
  end
  object edLoad: TEdit
    Left = 56
    Top = 104
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'n/a'
  end
  object Button1: TButton
    Left = 97
    Top = 128
    Width = 80
    Height = 25
    Caption = 'Stop'
    TabOrder = 4
    OnClick = Button1Click
  end
  object edClock: TEdit
    Left = 56
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 5
    Text = 'n/a'
  end
  object edMemory: TEdit
    Left = 56
    Top = 80
    Width = 121
    Height = 21
    TabOrder = 6
    Text = 'n/a'
  end
  object TrackBar1: TTrackBar
    Left = 0
    Top = 159
    Width = 185
    Height = 45
    Max = 1000
    Min = 250
    Position = 1000
    TabOrder = 7
    TickMarks = tmBoth
    TickStyle = tsNone
  end
  object tmrUpdate: TTimer
    Enabled = False
    OnTimer = tmrUpdateTimer
    Left = 32
    Top = 24
  end
end
