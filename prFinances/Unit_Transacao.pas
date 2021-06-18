unit Unit_Transacao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.ScrollBox, FMX.Memo, FMX.Edit, FMX.DateTimeCtrls,
  FMX.Controls.Presentation;

type
  TfrmTrancacao = class(TForm)
    btnExcluir: TButton;
    btnSalvar: TButton;
    dtData: TDateEdit;
    txtValor: TEdit;
    txtDescricao: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTrancacao: TfrmTrancacao;

implementation

{$R *.fmx}

end.
