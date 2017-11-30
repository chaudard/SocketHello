object FormServer: TFormServer
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Server'
  ClientHeight = 71
  ClientWidth = 120
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ServerSocket1: TServerSocket
    Active = False
    Port = 8080
    ServerType = stNonBlocking
    OnClientConnect = ServerSocket1ClientConnect
    OnClientDisconnect = ServerSocket1ClientDisconnect
    OnClientRead = ServerSocket1ClientRead
    Left = 32
    Top = 16
  end
end
