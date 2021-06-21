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
    lblCodigo: TLabel;
    Label4: TLabel;
    btnLimpar: TButton;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure inserirTransacao;
    procedure atualizarTransacao;
    procedure deletarTransacao;
    function validateFields:boolean;
    procedure clearFields();
    procedure setCurrentRegister(transacao: TObj_Transacao);
    procedure updateUiByCurrentRegister;
  end;

var
  frmTrancacao: TfrmTrancacao;
  currentRegister: TObj_Transacao;


implementation

{$R *.fmx}

procedure TfrmTrancacao.atualizarTransacao;
begin
    currentRegister.setValor(StrToFloat(txtValor.Text));
    currentRegister.setData(dtData.Date);
    currentRegister.setDescricao(txtDescricao.Text);
    currentRegister.update;

    ShowMessage('Registro atualizado com sucesso!');
end;

procedure TfrmTrancacao.btnExcluirClick(Sender: TObject);
begin
  deletarTransacao;
end;

procedure TfrmTrancacao.btnLimparClick(Sender: TObject);
begin
     clearFields;
     currentRegister := nil;
end;

procedure TfrmTrancacao.btnSalvarClick(Sender: TObject);
begin
  if not(validateFields) then
      exit;

  if not(currentRegister = nil) and (currentRegister.getCodigo <> 0)then
     atualizarTransacao
  else
    inserirTransacao;

end;

procedure TfrmTrancacao.clearFields;
begin
    txtValor.Text := '';
    txtDescricao.Text := '';
    lblCodigo.Text := '0';
end;

procedure TfrmTrancacao.deletarTransacao;
begin
   if currentRegister <> nil then
   begin
      currentRegister.delete;
      ShowMessage('Registro excluído com sucesso!');
      clearFields;
   end;

end;

procedure  TfrmTrancacao.inserirTransacao;
var
  transacao : TObj_Transacao;
begin
    transacao := TObj_Transacao.Create;
    transacao.setValor(StrToFloat(txtValor.Text));
    transacao.setData(dtData.Date);
    transacao.setDescricao(txtDescricao.Text);
    transacao.insert;

    transacao.setCodigo(transacao.getUltimoCodigoInserido);
    lblCodigo.Text := IntToStr(transacao.getCodigo);
    ShowMessage('Registro inserido com sucesso!');
    currentRegister := transacao;
end;

procedure TfrmTrancacao.setCurrentRegister(transacao: TObj_Transacao);
begin
  currentRegister := transacao;
  updateUiByCurrentRegister;
end;

procedure TfrmTrancacao.updateUiByCurrentRegister;
begin
  if currentRegister <> nil then
  begin
    lblCodigo.Text := inttostr(currentRegister.getCodigo);
    txtValor.Text := FloatToStr(currentRegister.getValor);
    dtData.Date := currentRegister.getData;
    txtDescricao.Text := currentRegister.getDescricao;
  end
  else
  begin
    lblCodigo.Text := '0';
    txtValor.Text := '';
    txtDescricao.Text := '';
  end;
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
