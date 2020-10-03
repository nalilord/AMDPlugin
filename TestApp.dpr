program TestApp;

uses
  Vcl.Forms,
  Main in 'Main.pas' {frmMain},
  adl_defines in 'adl_defines.pas',
  adl_sdk in 'adl_sdk.pas',
  adl_structures in 'adl_structures.pas',
  adl in 'adl.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
