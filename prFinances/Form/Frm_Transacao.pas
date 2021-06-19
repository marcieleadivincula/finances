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
    procedure inserirTransacao;
    function validateFields:boolean;
    procedure clearFields();
  end;

var
  frmTrancacao: TfrmTrancacao;

implementation

{$R *.fmx}

procedure TfrmTrancacao.btnSalvarClick(Sender: TObject);
begin
  inserirTransacao;
end;

procedure TfrmTrancacao.clearFields;
begin
    txtValor.Text := '';
    txtDescricao.Text := '';
end;

procedure  TfrmTrancacao.inserirTransacao;
var
  transacao : TObj_Transacao;
begin
    if not(validateFields) then
      exit;

    transacao := TObj_Transacao.Create;
    transacao.setValor(StrToFloat(txtValor.Text));
    transacao.setData(dtData.Date);
    transacao.setDescricao(txtDescricao.Text);
    transacao.insert;

    ShowMessage('Registro inserido com sucesso!');
    clearFields;
end;

function TfrmTrancacao.validateFields: boolean;
var
 valorIsFloat : boolean;
 valor: double;
begin
     valorIsFloat := TryStrToFloat(txtValor.Text, valor);
     if not(valorIsFloat) then
     begin
        ShowMessage('Valor não informado ou incorreto');
        result := false;
        exit;
     end
      else if txtDescricao.Text = '' then
      begin
        ShowMessage('O campo Descriçao é obrigatório!');
        result := false;
        exit;
      end;
      result := true;
end;

end.
