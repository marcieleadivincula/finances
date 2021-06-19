program prFinances;

uses
  System.StartUpCopy,
  FMX.Forms,
  Frm_Principal in 'Form\Frm_Principal.pas' {frmPrincipal},
  Unit_Transacao in 'Classes\Unit_Transacao.pas',
  Frm_Transacao in 'Form\Frm_Transacao.pas' {frmTrancacao},
  Unit_Dados in 'Classes\Unit_Dados.pas' {dm_dados};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmTrancacao, frmTrancacao);
  Application.CreateForm(Tdm_dados, dm_dados);
  Application.Run;
end.
