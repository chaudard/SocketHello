unit ClientGUI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ScktComp;

type
  TFormClient = class(TForm)
    btConnexion: TButton;
    Label1: TLabel;
    edName: TEdit;
    btSend: TButton;
    Label2: TLabel;
    edResponse: TEdit;
    ClientSocket1: TClientSocket;
    procedure btConnexionClick(Sender: TObject);
    procedure btSendClick(Sender: TObject);
    procedure ClientSocket1Disconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Error(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormClient: TFormClient;

implementation

{$R *.dfm}

procedure TFormClient.btConnexionClick(Sender: TObject);
begin
  //127.0.0.1 is the standard IP address to loop back to your own machine
  ClientSocket1.Address:='127.0.0.1';
  // i use port : 8080 (see also in server part)
  ClientSocket1.Active := True;//Activates the client
  btConnexion.Caption:='Disconnect';
  if(ClientSocket1.Socket.Connected=True)
  then
  begin
    ClientSocket1.Active := False;//Disconnects the client
    btConnexion.Caption:='Connect';
  end
  else
  begin
      btSend.Enabled:=true;
      edName.Enabled:=true;
      edName.Text := '';
  end;
end;

procedure TFormClient.btSendClick(Sender: TObject);
var
  str: string;
begin
  Str := edName.Text;
  edName.Text := '';
  edResponse.Text := '';
  ClientSocket1.Socket.SendText(str);//Send the messages to the server
end;

procedure TFormClient.ClientSocket1Disconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  edResponse.Text := '';
  edName.Text := 'client disconnected';
  //A client cannot send messages if it is not connected to a server
  btSend.Enabled:=False;
  edName.Enabled:=False;
  btConnexion.Caption:='Connect';
end;

procedure TFormClient.ClientSocket1Error(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  ErrorCode:=0;
  ClientSocket1.Active := False;
// This can happen when no active server is started
  EdResponse.Text:='No connection found';
end;

procedure TFormClient.ClientSocket1Read(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  edResponse.Text := Socket.ReceiveText;
end;

end.
