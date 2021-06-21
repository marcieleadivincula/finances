unit Frm_Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, System.Rtti, FMX.Grid.Style,
  FMX.ScrollBox, FMX.Grid, frm_transacao, Unit_Transacao, System.Generics.Collections;

type
  TfrmPrincipal = class(TForm)
    lbEntradas: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbSaidas: TLabel;
    lbTotal: TLabel;
    grid: TStringGrid;
    btnNovo: TButton;
    clValor: TCurrencyColumn;
    clData: TDateColumn;
    clDescricao: TStringColumn;
    IntegerColumn1: TIntegerColumn;
    procedure btnNovoClick(Sender: TObject);
    procedure gridCellClick(const Column: TColumn; const Row: Integer);
    procedure FormCreate(Sender: TObject);
    procedure PopulateGrid;
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

  frmTrancacao.setCurrentRegister(nil);
  frmTrancacao.ShowModal;
  PopulateGrid;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
    PopulateGrid;
end;

procedure TfrmPrincipal.gridCellClick(const Column: TColumn;
  const Row: Integer);
begin

  currentRegister := TObj_Transacao.Create;
  currentRegister.setCodigo(StrToInt(grid.Cells[0, row]));
  currentRegister.select;
  frmTrancacao.setCurrentRegister(currentRegister);
  frmTrancacao.ShowModal;
  PopulateGrid;

end;

procedure TfrmPrincipal.PopulateGrid;
var
transacoes: TObjectList<TObj_Transacao>;
transacao:  TObj_Transacao;
l : integer;
begin
    transacoes := transacao.getAll;
    grid.RowCount := transacoes.Count;

    for l := 1 to transacoes.Count do
       begin
         grid.Cells[0,l-1] :=  IntToStr(transacoes.Items[l-1].getCodigo);
         grid.Cells[1,l-1] :=  FloatToStr(transacoes.Items[l-1].getValor);
         grid.Cells[2,l-1] :=  DateToStr(transacoes.Items[l-1].getData);
         grid.Cells[3,l-1] :=  transacoes.Items[l-1].getDescricao;
       end;
end;

end.


