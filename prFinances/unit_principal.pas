unit unit_principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, System.Rtti, FMX.Grid.Style,
  FMX.ScrollBox, FMX.Grid;

type
  TForm1 = class(TForm)
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

end.
