unit Frm_Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, System.Rtti, FMX.Grid.Style,
  FMX.ScrollBox, FMX.Grid, frm_transacao, Unit_Transacao;

type
  TfrmPrincipal = class(TForm)
    lbEntradas: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbSaidas: TLabel;
    lbTotal: TLabel;
    StringGrid1: TStringGrid;
    btnNovo: TButton;
    clValor: TCurrencyColumn;
    clData: TDateColumn;
    clDescricao: TStringColumn;
    IntegerColumn1: TIntegerColumn;
    procedure btnNovoClick(Sender: TObject);
    procedure StringGrid1CellClick(const Column: TColumn; const Row: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

procedure TfrmPrincipal.btnNovoClick(Sender: TObject);
var
currentRegister: TObj_Transacao;
begin
  if frmTrancacao = nil then
    frmTrancacao := frmTrancacao.Create(self);

  frmTrancacao.Show;
end;

procedure TfrmPrincipal.StringGrid1CellClick(const Column: TColumn;
  const Row: Integer);
begin
    {
                                           Exemplo de como abrir formulario preenchido com dados do registro
  currentRegister := TObj_Transacao.Create;
  currentRegister.setCodigo(PASSAR ID DA LINHA CLICADA);
  currentRegister.select;
  frmTrancacao.setCurrentRegister(currentRegister);
  }

end;

end.


