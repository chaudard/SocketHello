unit ServerGUI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ScktComp;

type
  TFormServer = class(TForm)
    ServerSocket1: TServerSocket;
    procedure FormCreate(Sender: TObject);
    procedure ServerSocket1ClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormServer: TFormServer;

implementation

{$R *.dfm}

procedure TFormServer.FormCreate(Sender: TObject);
begin
  ServerSocket1.Active := True;//Activates the server socket
end;

procedure TFormServer.ServerSocket1ClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  Socket.SendText('Connected');//Sends a message to the client
end;

procedure TFormServer.ServerSocket1ClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  if ServerSocket1.Socket.ActiveConnections-1=0 then
  begin
    //
  end;
end;

procedure TFormServer.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  i: integer;
  myText: AnsiString;
  receive: AnsiString;
  myPreparedText: string;
begin
  receive := Socket.ReceiveText;
  myPreparedText := format('Hello %s', [receive]);
  MyText := myPreparedText;
  for i:=0 to ServerSocket1.Socket.ActiveConnections-1 do
    ServerSocket1.Socket.Connections[i].SendText(MyText);//Sent
end;

end.
