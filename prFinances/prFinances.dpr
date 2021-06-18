program prFinances;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit_Principal in 'Unit_Principal.pas' {frmPrincipal},
  Unit_Transacao in 'Unit_Transacao.pas' {frmTrancacao};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmTrancacao, frmTrancacao);
  Application.Run;
end.
