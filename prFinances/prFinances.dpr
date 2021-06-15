program prFinances;

uses
  System.StartUpCopy,
  FMX.Forms,
  unit_principal in 'unit_principal.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
