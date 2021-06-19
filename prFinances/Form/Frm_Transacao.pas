unit Frm_Transacao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.ScrollBox, FMX.Memo, FMX.Edit, FMX.DateTimeCtrls,
  FMX.Controls.Presentation, Unit_Transacao;

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
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTrancacao: TfrmTrancacao;

implementation

{$R *.fmx}

procedure TfrmTrancacao.btnSalvarClick(Sender: TObject);
var
  transacao : TObj_Transacao;
begin
    transacao := TObj_Transacao.Create;
    transacao.setValor(StrToFloat(txtValor.Text));
    transacao.setData(dtData.Date);
    transacao.setDescricao(txtDescricao.Text);
    transacao.insert;
end;

end.
