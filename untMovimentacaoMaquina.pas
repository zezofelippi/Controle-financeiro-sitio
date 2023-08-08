unit untMovimentacaoMaquina;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ComCtrls, Mask, ToolEdit, CurrEdit, Grids,
  DBGrids, DB, IBCustomDataSet, IBQuery, IBDatabase;

type
  TfrmMovimentacaoMaquina = class(TForm)
    gpb1: TGroupBox;
    cboMaquina: TDBLookupComboBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    edtTempo: TMaskEdit;
    lbl4: TLabel;
    edtQtdCombustivel: TRxCalcEdit;
    lbl5: TLabel;
    edtObs: TEdit;
    btnGravar: TButton;
    gpb2: TGroupBox;
    cboMaquinaPesq: TDBLookupComboBox;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl9: TLabel;
    edtObsPesq: TEdit;
    btnPesquisar: TButton;
    gpb3: TGroupBox;
    grd1: TDBGrid;
    lbl8: TLabel;
    qry_movimento: TIBQuery;
    IBTRANSLOCAL: TIBTransaction;
    qryPesquisa: TIBQuery;
    ibstrngfldPesquisaMAQUINA: TIBStringField;
    dtmfldPesquisaMOV_DATA: TDateTimeField;
    tmfldPesquisaMOV_TEMPO: TTimeField;
    ibcdfldPesquisaMOV_QTD_COMBUSTIVEL: TIBBCDField;
    ibstrngfldPesquisaMOV_OBS: TIBStringField;
    dsPesquisa: TDataSource;
    edtData: TDateEdit;
    edtDataInicial: TDateEdit;
    edtDataFinal: TDateEdit;
    rdb_inicio: TRadioButton;
    rdb_posicao: TRadioButton;
    dsMaquina: TDataSource;
    qryMaquina: TIBQuery;
    ibstrngfldMaquinaMAQUINA: TIBStringField;
    qryMaquinaMAQ_CODIGO: TIntegerField;
    lbl10: TLabel;
    lbl11: TLabel;
    edtTotalQtdCombustivel: TRxCalcEdit;
    qryTotal: TIBQuery;
    edtTotalTempo: TEdit;
    ibstrngfldPesquisaMOV_MANUTENCAO: TIBStringField;
    chkManutencao: TCheckBox;
    procedure btnGravarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cboMaquinaPesqKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cboMaquinaKeyPress(Sender: TObject; var Key: Char);
    procedure edtDataKeyPress(Sender: TObject; var Key: Char);
    procedure edtTempoKeyPress(Sender: TObject; var Key: Char);
    procedure edtQtdCombustivelKeyPress(Sender: TObject; var Key: Char);
    procedure edtObsKeyPress(Sender: TObject; var Key: Char);
    procedure grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grd1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMovimentacaoMaquina: TfrmMovimentacaoMaquina;
  mensagem : string;

implementation

uses unt_modulo;

{$R *.dfm}

procedure TfrmMovimentacaoMaquina.btnGravarClick(Sender: TObject);
begin

  if cboMaquina.Text = '' then
  begin
    showmessage('Coloque a maquina');
    cboMaquina.SetFocus;
    exit;
  end;
  if edtData.Text = '  /  /    ' then
  begin
    showmessage('Coloque a data');
    edtData.SetFocus;
    exit;
  end;

  if not IBTRANSLOCAL.InTransaction then
    IBTRANSLOCAL.StartTransaction;
  qry_movimento.Close;
  qry_movimento.SQL.Clear;
  qry_movimento.SQL.Add('INSERT INTO MOVIMENTACAO_MAQUINA (MAQ_CODIGO, MOV_DATA, MOV_TEMPO, MOV_QTD_COMBUSTIVEL, MOV_OBS)  '+
                        'VALUES (:MAQ_CODIGO, :MOV_DATA, :MOV_TEMPO, :MOV_QTD_COMBUSTIVEL, :MOV_OBS)                       ');
  qry_movimento.ParamByName('MAQ_CODIGO').AsInteger         := cboMaquina.KeyValue;
  qry_movimento.ParamByName('MOV_DATA').AsString            := edtData.text;
  qry_movimento.ParamByName('MOV_TEMPO').AsString           := edtTempo.Text;
  qry_movimento.ParamByName('MOV_QTD_COMBUSTIVEL').AsFloat := edtQtdCombustivel.Value;
  qry_movimento.ParamByName('MOV_OBS').asstring             := edtObs.text;

  qry_movimento.ExecSQL;
  IBTRANSLOCAL.Commit;

  cboMaquina.keyvalue := -1;
  edtData.Clear;
  edtTempo.Clear;
  edtQtdCombustivel.Clear;
  edtObs.Clear;

    
end;

procedure TfrmMovimentacaoMaquina.btnPesquisarClick(Sender: TObject);
var
  dta, data1, data2, maquina, obs, manutencao : string;
begin

  data1 := Copy(edtDataInicial.Text,4,3) + Copy(edtDataInicial.Text,1,3) + Copy(edtDataInicial.Text,7,4) + ' 00:00:00';
  data2 := Copy(edtDataFinal.Text,4,3) + Copy(edtDataFinal.Text,1,3) + Copy(edtDataFinal.Text,7,4) + ' 23:59:59';

  if (edtDataInicial.Text <> '  /  /    ') and (edtDataFinal.Text <> '  /  /    ') then
    dta := ' AND MOV.MOV_DATA BETWEEN '+ #39 + data1 + #39 + ' AND '+ #39 + data2 + #39
  else
    dta := '';

  if ((edtDataInicial.Text <> '  /  /    ') and (edtDataFinal.Text = '  /  /    ') or
     (edtDataInicial.Text = '  /  /    ') and (edtDataFinal.Text <> '  /  /    '))  then
  begin
    mensagem := 'Informe Intervalo de Datas !';
    Application.MessageBox(Pchar(mensagem), 'Informação', MB_OK+MB_ICONWARNING);
    edtDataInicial.SetFocus;
    exit;
  end;

  if cboMaquinaPesq.Text <> '' then
    maquina := ' AND MAQ.MAQ_CODIGO = ' + IntToStr(cboMaquinaPesq.KeyValue)
  else
    maquina := '';

  if (edtObsPesq.Text <> '') and (rdb_inicio.Checked = TRUE) then
     obs  := ' AND UPPER(MOV.MOV_OBS) LIKE UPPER('+ #39 + edtObsPesq.Text + '%' + #39 + ')'
  else if (edtObsPesq.Text <> '') and (rdb_posicao.Checked = TRUE) then
     obs  := ' AND UPPER(MOV.MOV_OBS) LIKE UPPER('+ #39 + '%' + edtObsPesq.Text + '%' + #39 + ')'
  else
     obs  := '';

  if chkManutencao.Checked = True then
    manutencao := ' AND MOV_MANUTENCAO = ''S'' '
  else
    manutencao := '';

  qryPesquisa.close;
  qryPesquisa.sql.Clear;
  qryPesquisa.SQL.Add('SELECT MAQ.maq_codigo || '' - '' || MAQ.maq_descricao AS MAQUINA,                     '+
                      'mov.mov_data, MOV.mov_tempo, MOV.mov_qtd_combustivel, MOV.mov_obs, MOV.MOV_MANUTENCAO '+
                      'FROM cad_maquina MAQ                                                                  '+
                      'INNER JOIN movimentacao_maquina MOV ON                                                '+
                      'MAQ.maq_codigo = MOV.maq_codigo                                                       '+
                      'WHERE 1=1 ' + dta + maquina + obs + manutencao                                         );
  qryPesquisa.open;

  qryTotal.Close;
  qryTotal.sql.Clear;
  qryTotal.SQL.Add('SELECT  SUM(MOV_QTD_COMBUSTIVEL) AS TOTAL_COMBUSTIVEL                '+
                   'FROM cad_maquina MAQ                                                 '+
                   'INNER JOIN movimentacao_maquina MOV ON                               '+
                   'MAQ.maq_codigo = MOV.maq_codigo                                      '+
                   'WHERE 1=1 ' + dta + maquina + obs + manutencao                        );
  qryTotal.open;

  edtTotalQtdCombustivel.Value := qryTotal.fieldbyname('TOTAL_COMBUSTIVEL').AsFloat;

  qryTotal.Close;
  qryTotal.sql.Clear;
  qryTotal.SQL.Add('    SELECT                                                                                            '+
                   '    case when (MOV_TEMPO/3600) > 10 then ''0''||(MOV_TEMPO/3600) else (MOV_TEMPO/3600) end ||'':''||  '+
                   '    CASE when ((MOV_TEMPO-((MOV_TEMPO)/3600)*3600)/60) < 10 then                                      '+
                   ' ''0''||((MOV_TEMPO-((MOV_TEMPO)/3600)*3600)/60) else                                                 '+
                   '((MOV_TEMPO-((MOV_TEMPO)/3600)*3600)/60) end AS TOTAL_HORA                                            '+
                   'FROM                                                                                                  '+
                   '(                                                                                                     '+
                   'SELECT                                                                                                '+
                   '    CAST(SUM(                                                                                         '+
                   '        EXTRACT( HOUR FROM MOV_TEMPO ) * 3600 +                                                       '+
                   '        EXTRACT( MINUTE FROM MOV_TEMPO ) * 60 +                                                       '+
                   '        EXTRACT( SECOND FROM MOV_TEMPO )                                                              '+
                   '    ) AS INTEGER) AS MOV_TEMPO                                                                        '+
                   'FROM movimentacao_maquina MOV                                                                         '+
                   ' INNER JOIN CAD_MAQUINA MAQ ON                                                                        '+
                   ' MOV.MAQ_CODIGO = MAQ.MAQ_CODIGO                                                                      '+
                   'WHERE 1=1 ' + dta + maquina + obs +  manutencao + ')                                                  ');
  qryTotal.open;

  edtTotalTempo.Text := qryTotal.fieldbyname('TOTAL_HORA').AsString;


end;

procedure TfrmMovimentacaoMaquina.FormShow(Sender: TObject);
begin
  qryMaquina.Close;
  qryMaquina.SQL.Clear;
  qryMaquina.SQL.Add('SELECT MAQ_CODIGO ||'' - ''|| MAQ_DESCRICAO AS MAQUINA, '+
                     'MAQ_CODIGO                                              '+
                     'FROM CAD_MAQUINA                                        ');
  qryMaquina.open;
  qryMaquina.fetchall;

  cboMaquina.SetFocus;
end;

procedure TfrmMovimentacaoMaquina.cboMaquinaPesqKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_Back then
    cboMaquinaPesq.KeyValue := NULL;
end;

procedure TfrmMovimentacaoMaquina.cboMaquinaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    edtData.SetFocus;
end;

procedure TfrmMovimentacaoMaquina.edtDataKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key =#13 then
    edttempo.SetFocus;
end;

procedure TfrmMovimentacaoMaquina.edtTempoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    edtQtdCombustivel.SetFocus;
end;

procedure TfrmMovimentacaoMaquina.edtQtdCombustivelKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key =#13 then
    edtObs.SetFocus;
end;

procedure TfrmMovimentacaoMaquina.edtObsKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key =#13 then
    btnGravar.SetFocus;
end;

procedure TfrmMovimentacaoMaquina.grd1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if qryPesquisa.FieldByName('MOV_MANUTENCAO').AsString = 'S' THEN
    grd1.Canvas.Brush.Color := claqua;

  if (gdSelected in state) then
  with (Sender as TDBGrid).Canvas do
  begin
    Font.Style  := [fsbold];
    grd1.Canvas.Brush.Color := clWhite;
  end;

  grd1.Canvas.Font.Color:= clBlack;

  grd1.Canvas.FillRect(Rect);
  grd1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TfrmMovimentacaoMaquina.grd1TitleClick(Column: TColumn);
var 
  dta, data1, data2, maquina, obs, campo, manutencao : string;
begin

  campo := column.fieldname; // CAMPO RECEBE O NOME DA COLUNA CLICADA,
  application.processmessages; // para considerar algo que aconteça no dbgrid durante a entrada nesta procedure


  if (campo = 'mov_data') or (campo = 'mov_obs') then
    campo := 'MOV.' + campo
  else if (campo = 'MAQUINA') Then
    campo := 'MAQ.maq_codigo '
  else
    campo := '' + campo ;

  data1 := Copy(edtDataInicial.Text,4,3) + Copy(edtDataInicial.Text,1,3) + Copy(edtDataInicial.Text,7,4) + ' 00:00:00';
  data2 := Copy(edtDataFinal.Text,4,3) + Copy(edtDataFinal.Text,1,3) + Copy(edtDataFinal.Text,7,4) + ' 23:59:59';

  if (edtDataInicial.Text <> '  /  /    ') and (edtDataFinal.Text <> '  /  /    ') then
    dta := ' AND MOV.MOV_DATA BETWEEN '+ #39 + data1 + #39 + ' AND '+ #39 + data2 + #39
  else
    dta := '';

  if ((edtDataInicial.Text <> '  /  /    ') and (edtDataFinal.Text = '  /  /    ') or
     (edtDataInicial.Text = '  /  /    ') and (edtDataFinal.Text <> '  /  /    '))  then
  begin
    mensagem := 'Informe Intervalo de Datas !';
    Application.MessageBox(Pchar(mensagem), 'Informação', MB_OK+MB_ICONWARNING);
    edtDataInicial.SetFocus;
    exit;
  end;

  if cboMaquinaPesq.Text <> '' then
    maquina := ' AND MAQ.MAQ_CODIGO = ' + IntToStr(cboMaquinaPesq.KeyValue)
  else
    maquina := '';

  if (edtObsPesq.Text <> '') and (rdb_inicio.Checked = TRUE) then
     obs  := ' AND UPPER(MOV.MOV_OBS) LIKE UPPER('+ #39 + edtObsPesq.Text + '%' + #39 + ')'
  else if (edtObsPesq.Text <> '') and (rdb_posicao.Checked = TRUE) then
     obs  := ' AND UPPER(MOV.MOV_OBS) LIKE UPPER('+ #39 + '%' + edtObsPesq.Text + '%' + #39 + ')'
  else
     obs  := '';

  if chkManutencao.Checked = True then
    manutencao := ' AND MOV_MANUTENCAO = ''S'' '
  else
    manutencao := '';

  qryPesquisa.close;
  qryPesquisa.sql.Clear;
  qryPesquisa.SQL.Add('SELECT MAQ.maq_codigo || '' - '' || MAQ.maq_descricao AS MAQUINA,                     '+
                      'mov.mov_data, MOV.mov_tempo, MOV.mov_qtd_combustivel, MOV.mov_obs, MOV.MOV_MANUTENCAO '+
                      'FROM cad_maquina MAQ                                                                  '+
                      'INNER JOIN movimentacao_maquina MOV ON                                                '+
                      'MAQ.maq_codigo = MOV.maq_codigo                                                       '+
                      'WHERE 1=1 ' + dta + maquina + obs + manutencao + ' order by ' + campo                  );
  qryPesquisa.open;
end;

end.
