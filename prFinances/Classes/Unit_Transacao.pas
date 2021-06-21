unit Unit_Transacao;

interface

uses
    unit_dados, FireDAC.Comp.Client, System.SysUtils, Vcl.Dialogs, Vcl.StdCtrls, System.Generics.Collections;

type
    TObj_Transacao = class
      private
             codigo:integer;
             valor: real;
             data: TDate;
             descricao: string;
      public
            procedure setCodigo(codigo:integer);
            function getCodigo:integer;

            procedure setValor(valor:double);
            function getValor:double;

            procedure setData(data:TDate);
            function getData:TDate;

            procedure setDescricao(descricao:string);
            function getDescricao:string;

            procedure insert;
            procedure update;
            function delete:boolean;
            function select:boolean;
            function getUltimoCodigoInserido:integer;
            function getAll: TObjectList<TObj_Transacao>;
    end;

implementation

{ TObj_Transacao }


function TObj_Transacao.getAll: TObjectList<TObj_Transacao>;
var
   qrSelect:TFDQuery;
   transacao: TObj_Transacao;
   list: TObjectList<TObj_Transacao>;
begin
    list := TObjectList<TObj_Transacao>.Create;
    qrSelect := TFDQuery.Create(nil);
    if dm_Dados = nil then
        dm_dados := Tdm_dados.Create(nil);
     qrSelect.Connection := dm_Dados.fdTransacao;
     qrSelect.SQL.Clear;
     qrSelect.SQL.Add('select * from transacao order by codigo desc');

     try
        qrSelect.open;
        if (not qrSelect.IsEmpty) then
        begin
            qrSelect.First;
            while (not qrSelect.Eof) do
            begin
                transacao := TObj_Transacao.Create;
                transacao.setCodigo(qrSelect.Fields[0].AsInteger);
                transacao.setValor(qrSelect.Fields[1].AsFloat);
                transacao.setData(qrSelect.Fields[2].AsDateTime);
                transacao.setDescricao(qrSelect.Fields[3].AsString);

                list.Add(transacao);
                qrSelect.Next;
            end;
        end;

     except
           on e:Exception do
              ShowMessage('Erro ao buscar dados: ' + e.ToString);
     end;

     qrSelect.Free;
     result := list;
end;

procedure TObj_Transacao.insert;
var
   qrInsert:TFDQuery;
begin
     qrInsert := TFDQuery.Create(nil);
     qrInsert.Connection := dm_Dados.fdTransacao;
     qrInsert.SQL.Clear;
     qrInsert.SQL.Add('insert into Transacao values (0, :valor, :data, :descricao)');
     qrInsert.Params[0].AsFloat := self.getValor;
     qrInsert.Params[1].AsDate := self.getData;
     qrInsert.Params[2].AsString := self.getDescricao;

     try
        qrInsert.ExecSQL;
        self.setCodigo(getUltimoCodigoInserido);
     except
           on e:Exception do
              ShowMessage('Erro de inserção: ' + e.ToString);
     end;

     qrInsert.Free;
end;


procedure TObj_Transacao.update;
var
   qrUpdate:TFDQuery;
begin
     qrUpdate := TFDQuery.Create(nil);
     qrUpdate.Connection := dm_Dados.fdTransacao;
     qrUpdate.SQL.Clear;
     qrUpdate.SQL.Add('update Transacao  set valor = :valor, data = :data, descricao = :descricao ');
     qrUpdate.SQL.Add('where (codigo = :codigo)');
     qrUpdate.Params[0].AsFloat := self.getValor;
     qrUpdate.Params[1].AsDate := self.getData;
     qrUpdate.Params[2].AsString := self.getDescricao;
     qrUpdate.Params[3].AsInteger := self.getCodigo;

     try
        qrUpdate.ExecSQL;
     except
           on e:Exception do
              ShowMessage('Erro de aleração de dados: ' + e.ToString);
     end;

     qrUpdate.Free;
end;

function TObj_Transacao.delete:boolean;
var
   qrDelete:TFDQuery;
begin
     qrDelete := TFDQuery.Create(nil);
     qrDelete.Connection := dm_Dados.fdTransacao;
     qrDelete.SQL.Clear;
     qrDelete.SQL.Add('delete from Transacao ');
     qrDelete.SQL.Add('where (codigo = :codigo)');
     qrDelete.Params[0].AsInteger := self.getCodigo;

     try
        qrDelete.ExecSQL;
        result := true;
     except
           on e:Exception do
             begin
                  result := false;
                  ShowMessage('Erro de exclusão de dados: ' + e.ToString);
             end;
     end;

     qrDelete.Free;
end;

function TObj_Transacao.select:boolean;
var
   qrSelect:TFDQuery;
begin
     result := false;
     qrSelect := TFDQuery.Create(nil);
     qrSelect.Connection := dm_Dados.fdTransacao;
     qrSelect.SQL.Clear;
     qrSelect.SQL.Add('select * from Transacao ');
     qrSelect.SQL.Add('where (codigo = :codigo)');
     qrSelect.Params[0].AsInteger := self.getCodigo;

     try
        qrSelect.Open;

        if (not qrSelect.IsEmpty) then
          begin
               self.setValor(qrSelect.Fields[1].AsFloat);
               self.setData(qrSelect.Fields[2].AsDateTime);
               self.setDescricao(qrSelect.Fields[3].AsString);
               result := true;
          end;
     except
           on e:Exception do
              ShowMessage('Erro de exclusão de dados: ' + e.ToString);
     end;

     qrSelect.Free;
end;


function TObj_Transacao.getUltimoCodigoInserido: integer;
var
   qrSelect:TFDQuery;
begin
     result := 0;
     qrSelect := TFDQuery.Create(nil);
     qrSelect.Connection := dm_Dados.fdTransacao;
     qrSelect.SQL.Clear;
     qrSelect.SQL.Add('select last_insert_id() codigo');

     try
        qrSelect.Open;

        if (not qrSelect.IsEmpty) then
          begin
               result := qrSelect.Fields[0].AsInteger;
          end;
     except
           on e:Exception do
              ShowMessage('Erro de retorno de código: ' + e.ToString);
     end;

     qrSelect.Free;
end;


function TObj_Transacao.getCodigo: integer;
begin
     result := self.codigo;
end;

procedure TObj_Transacao.setCodigo(codigo: integer);
begin
     self.codigo := codigo;
end;


function TObj_Transacao.getValor: double;
begin
     result := self.valor;
end;

procedure TObj_Transacao.setValor(valor: double);
begin
     self.valor := valor;
end;


function TObj_Transacao.getData: TDate;
begin
     result := self.data;
end;


procedure TObj_Transacao.setData(data: TDate);
begin
     self.data := data;
end;


function TObj_Transacao.getDescricao: string;
begin
     result := self.Descricao;
end;


procedure TObj_Transacao.setDescricao(Descricao: string);
begin
     self.Descricao := Descricao;
end;

end.

