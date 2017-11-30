program Server;

uses
  Forms,
  ServerGUI in 'ServerGUI.pas' {FormServer};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.ShowMainForm := false; // not to see the server GUI
  Application.CreateForm(TFormServer, FormServer);
  Application.Run;
end.
