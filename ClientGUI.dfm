object FormClient: TFormClient
  Left = 0
  Top = 0
  Caption = 'Client'
  ClientHeight = 173
  ClientWidth = 222
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 39
    Width = 98
    Height = 13
    Caption = 'What is your name ?'
  end
  object Label2: TLabel
    Left = 16
    Top = 120
    Width = 133
    Height = 13
    Caption = 'Response from Hello Server'
  end
  object btConnexion: TButton
    Left = 16
    Top = 8
    Width = 185
    Height = 25
    Caption = 'Connect/Disconnect'
    TabOrder = 0
    OnClick = btConnexionClick
  end
  object edName: TEdit
    Left = 16
    Top = 58
    Width = 185
    Height = 21
    TabOrder = 1
  end
  object btSend: TButton
    Left = 80
    Top = 85
    Width = 75
    Height = 25
    Caption = 'Send'
    TabOrder = 2
    OnClick = btSendClick
  end
  object edResponse: TEdit
    Left = 16
    Top = 139
    Width = 185
    Height = 21
    TabOrder = 3
  end
  object ClientSocket1: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 8080
    OnDisconnect = ClientSocket1Disconnect
    OnRead = ClientSocket1Read
    OnError = ClientSocket1Error
    Left = 168
    Top = 88
  end
end
