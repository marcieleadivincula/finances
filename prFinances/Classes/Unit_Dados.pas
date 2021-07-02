unit Unit_Dados;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet, FMX.frxClass, FMX.frxDBSet,
  FMX.frxPreview;

type
  Tdm_dados = class(TForm)
    fdTransacao: TFDConnection;
    fdQrTransacao: TFDQuery;
    fdTransactionTransacao: TFDTransaction;
    relatorio: TfrxReport;
    frx_transacoes: TfrxDBDataset;
    fdQrConsulta: TFDQuery;
    fdQrConsultacodigo: TFDAutoIncField;
    fdQrConsultavalor: TSingleField;
    fdQrConsultadata: TDateTimeField;
    fdQrConsultadescricao: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm_dados: Tdm_dados;

implementation

{$R *.fmx}

procedure Tdm_dados.FormCreate(Sender: TObject);
begin
     fdTransacao.Connected  := true;
end;

procedure Tdm_dados.FormDestroy(Sender: TObject);
begin
    fdTransacao.Connected  := false;
end;

end.
