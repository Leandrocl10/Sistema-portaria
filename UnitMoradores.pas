unit UnitMoradores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Grids, DBGrids, ExtCtrls;

type
  TFormMoradores = class(TForm)
    pnlPainelInferior: TPanel;
    btnEditar: TButton;
    btnExcluir: TButton;
    btnNovo: TButton;
    dbgrdMoradores: TDBGrid;
    conexao: TADOConnection;
    qryMoradores: TADOQuery;
    dsGridMoradores: TDataSource;
    lblNome: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMoradores: TFormMoradores;

implementation

{$R *.dfm}

procedure TFormMoradores.FormCreate(Sender: TObject);
var
i: Integer;
col: TColumn;
begin
  if not conexao.Connected then
  conexao.Connected := True;

  qryMoradores.Close;
  qryMoradores.SQL.Add('SELECT Nome,CPF, Bloco, Apartamento, Telefone, Email, Veiculo, Placa, DataHora');
  qryMoradores.SQL.add('FROM MORADORES');
  qryMoradores.SQL.add('ORDER BY Nome');
  qryMoradores.Open;

  //Liga datasouce com DBGRig
  dsGridMoradores.DataSet := qryMoradores;
  dbgrdMoradores.DataSource := dsGridMoradores;


  //Criar colunas na DBGRID
  dbgrdMoradores.Columns.Clear;
  for i := 0 to qryMoradores.Fields.Count -1 do
  begin
    col := dbgrdMoradores.Columns.Add;
    col.FieldName := qryMoradores.Fields[i].FieldName;
    col.Title.Caption := qryMoradores.Fields[i].DisplayName;

    //Formata largura e alinhamento por nome de campo
     if SameText(col.FieldName, 'CPF') or SameText(col.FieldName, 'Placa') then
    begin
      col.Alignment := taCenter;
      col.Title.Alignment := taCenter;
      col.Width := 100;
    end
    else if SameText(col.FieldName, 'DataHora') then
    begin
      col.Alignment := taCenter;
      col.Title.Alignment := taCenter;
      col.Width := 140;
      if qryMoradores.FieldByName('DataHora') is TDateTimeField then
        TDateTimeField(qryMoradores.FieldByName('DataHora')).DisplayFormat := 'dd/mm/yyyy hh:nn:ss';
    end
    else if SameText(col.FieldName, 'Nome') then
      col.Width := 200
    else if SameText(col.FieldName, 'Email') then
      col.Width := 180
    else
      col.Width := 100;
  end;

end;

end.
