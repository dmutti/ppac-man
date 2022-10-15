program pPPacMan;

uses
  Forms,
  uMain in 'uMain.pas' {frmMain},
  uMapGen in 'uMapGen.pas',
  uPacMan in 'uPacMan.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
