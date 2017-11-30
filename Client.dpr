program Client;

uses
  Forms,
  ClientGUI in 'ClientGUI.pas' {FormClient};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormClient, FormClient);
  Application.Run;
end.
