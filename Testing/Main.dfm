object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'AMD GPU Info'
  ClientHeight = 215
  ClientWidth = 456
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
  object Label4: TLabel
    Left = 8
    Top = 128
    Width = 30
    Height = 21
    AutoSize = False
    Caption = 'VRAM:'
    Layout = tlCenter
  end
  object btnGetInfo: TButton
    Left = 8
    Top = 155
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
    Left = 94
    Top = 155
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
    Top = 184
    Width = 456
    Height = 31
    Align = alBottom
    Max = 1000
    Min = 250
    Position = 1000
    TabOrder = 7
    TickMarks = tmBoth
    TickStyle = tsNone
  end
  object edVRAM: TEdit
    Left = 56
    Top = 128
    Width = 121
    Height = 21
    TabOrder = 8
    Text = 'n/a'
  end
  object GroupBox1: TGroupBox
    Left = 183
    Top = 8
    Width = 265
    Height = 141
    Caption = ' TD3DKMT Memory Info '
    TabOrder = 9
    object Label5: TLabel
      Left = 12
      Top = 24
      Width = 75
      Height = 13
      Caption = 'Memory Usage:'
    end
    object Label6: TLabel
      Left = 12
      Top = 45
      Width = 62
      Height = 13
      Caption = 'Shared Limit:'
    end
    object Label7: TLabel
      Left = 12
      Top = 68
      Width = 76
      Height = 13
      Caption = 'Dedicated Limit:'
    end
    object Label8: TLabel
      Left = 12
      Top = 91
      Width = 71
      Height = 13
      Caption = 'Shared Usage:'
    end
    object Label9: TLabel
      Left = 12
      Top = 114
      Width = 85
      Height = 13
      Caption = 'Dedicated Usage:'
    end
    object lblMemoryUsage: TStaticText
      Left = 104
      Top = 24
      Width = 158
      Height = 17
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = '-'
      TabOrder = 0
    end
    object lblSharedLimit: TStaticText
      Left = 104
      Top = 45
      Width = 158
      Height = 17
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = '-'
      TabOrder = 1
    end
    object lblDedicatedLimit: TStaticText
      Left = 104
      Top = 68
      Width = 158
      Height = 17
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = '-'
      TabOrder = 2
    end
    object lblSharedUsage: TStaticText
      Left = 103
      Top = 91
      Width = 159
      Height = 17
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = '-'
      TabOrder = 3
    end
    object lblDedicatedUsage: TStaticText
      Left = 103
      Top = 114
      Width = 159
      Height = 17
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = '-'
      TabOrder = 4
    end
  end
  object tmrUpdate: TTimer
    Enabled = False
    OnTimer = tmrUpdateTimer
    Left = 32
    Top = 24
  end
end
