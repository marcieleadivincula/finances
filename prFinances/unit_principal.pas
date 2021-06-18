unit Unit_Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, System.Rtti, FMX.Grid.Style,
  FMX.ScrollBox, FMX.Grid, unit_transacao;

type
  TfrmPrincipal = class(TForm)
    lbEntradas: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbSaidas: TLabel;
    lbTotal: TLabel;
    StringGrid1: TStringGrid;
    StringColumn1: TStringColumn;
    CurrencyColumn1: TCurrencyColumn;
    DateColumn1: TDateColumn;
    btnNovo: TButton;
    procedure btnNovoClick(Sender: TObject);
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
begin
  if frmTrancacao = nil then
    frmTrancacao := frmTrancacao.Create(self);

  frmTrancacao.Show;
end;

end.
