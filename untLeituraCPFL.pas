unit untLeituraCPFL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, Grids, DBGrids, DBCtrls, CurrEdit, DB,
  IBCustomDataSet, IBQuery, IBDatabase, DateUtils;

type
  TfrmLeituraCPFL = class(TForm)
    edt_data: TDateEdit;
    lbl1: TLabel;
    edtLeitura: TEdit;
    lbl2: TLabel;
    btnGravar: TButton;
    grd1: TDBGrid;
    lbl3: TLabel;
    edtDataInicial: TDateEdit;
    lbl4: TLabel;
    btnPesquisar: TButton;
    lbl5: TLabel;
    cboLugar: TDBLookupComboBox;
    lbl6: TLabel;
    cboPesqLugar: TDBLookupComboBox;
    edtDataFinal: TDateEdit;
    lbl7: TLabel;
    lbl8: TLabel;
    edt_Valor: TCurrencyEdit;
    dtsLugar: TDataSource;
    qryLugar: TIBQuery;
    ibstrngfldLugarLUGAR: TIBStringField;
    qryLugarCPFL_CODIGO: TIntegerField;
    IBTRANSLOCAL: TIBTransaction;
    qry_movimento: TIBQuery;
    qryAux: TIBQuery;
    qryPesquisa: TIBQuery;
    dtsPesquisa: TDataSource;
    dtmfldPesquisaDATA: TDateTimeField;
    qryPesquisaNUMERO_LEITURA: TIntegerField;
    ibcdfldPesquisaVALOR: TIBBCDField;
    qryPesquisaKWH: TIntegerField;
    qryPesquisaNUMERO_LEITURA_ANTERIOR: TIntegerField;
    ibstrngfldPesquisaLUGAR: TIBStringField;
    qryPesquisaKWHX10: TLargeintField;
    edtMedia: TRxCalcEdit;
    lbl9: TLabel;
    edtCodigo: TEdit;
    qryPesquisaCODIGO_CPFL: TIntegerField;
    qryPesquisaCPFL_CODIGO: TIntegerField;
    lbl10: TLabel;
    edtTotal: TCurrencyEdit;
    procedure btnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grd1TitleClick(Column: TColumn);
    procedure edtLeituraKeyPress(Sender: TObject; var Key: Char);
    procedure grd1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLeituraCPFL: TfrmLeituraCPFL;

implementation

uses unt_modulo;

{$R *.dfm}

procedure TfrmLeituraCPFL.btnGravarClick(Sender: TObject);
begin

  if cboLugar.Text = '' then
  begin
    showmessage('Coloque o lugar');
    cboLugar.SetFocus;
    exit;
  end;
  if edt_Data.Text = '  /  /    ' then
  begin
    showmessage('Coloque a data');
    edt_Data.SetFocus;
    exit;
  end;

  if edtLeitura.Text = '' then
  begin
    showmessage('Coloque a leitura');
    edtLeitura.SetFocus;
    exit;
  end;

  if edtCodigo.Text = '' then
  begin
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(' SELECT DATA FROM LEITURA_CPFL             '+
                   ' where EXTRACT(MONTH FROM DATA) =:mes and  '+
                   ' EXTRACT(YEAR FROM DATA) =:ANO             ');
    qryAux.ParamByName('mes').AsString:= formatdatetime('mm',strtodatetime(edt_data.text));
    qryAux.ParamByName('ano').AsString:= formatdatetime('yyyy',strtodatetime(edt_data.text));
    qryAux.Open;

    if not qryAux.IsEmpty then
    begin
      showmessage('Mes e ano informado já foi colocado');
      edt_data.SetFocus;
      exit;
    end;
  end;

  if edtCodigo.Text = '' then
  begin
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('SELECT NUMERO_LEITURA FROM LEITURA_CPFL ORDER BY DATA');
    qryAux.Open;
    qryAux.Last;

    if StrToInt(edtLeitura.text) < qryAux.FieldByName('NUMERO_LEITURA').AsInteger then
    begin
      showmessage('Numero de leitura menor que o anterior');
      edtLeitura.SetFocus;
      exit;
    end;
  end;


  If edtCodigo.Text = '' then
  begin
     if not IBTRANSLOCAL.InTransaction then
       IBTRANSLOCAL.StartTransaction;
      qry_movimento.Close;
      qry_movimento.SQL.Clear;
      qry_movimento.SQL.Add('INSERT INTO LEITURA_CPFL (CPFL_CODIGO, DATA, NUMERO_LEITURA, VALOR, NUMERO_LEITURA_ANTERIOR, KWH)  '+
                            'VALUES (:CPFL_CODIGO, :DATA, :NUMERO_LEITURA, :VALOR, :NUMERO_LEITURA_ANTERIOR, :KWH)              ');
      qry_movimento.ParamByName('CPFL_CODIGO').AsInteger       := cboLugar.KeyValue;
      qry_movimento.ParamByName('DATA').AsString               := edt_Data.text;
      qry_movimento.ParamByName('NUMERO_LEITURA').AsString     := edtLeitura.Text;
      qry_movimento.ParamByName('VALOR').AsFloat               := edt_valor.Value;
      if not qryAux.IsEmpty then
      begin
        qry_movimento.ParamByName('KWH').AsInteger :=  StrToInt(edtLeitura.Text) - qryAux.fieldbyname('NUMERO_LEITURA').AsInteger;
        qry_movimento.ParamByName('NUMERO_LEITURA_ANTERIOR').AsInteger := qryAux.fieldbyname('NUMERO_LEITURA').AsInteger;
      end
      else
      begin
        qry_movimento.ParamByName('KWH').AsInteger :=  0;
        qry_movimento.ParamByName('NUMERO_LEITURA_ANTERIOR').AsInteger := 0;
      end;
  end
  else
  begin
      if not IBTRANSLOCAL.InTransaction then
       IBTRANSLOCAL.StartTransaction;
      qry_movimento.Close;
      qry_movimento.SQL.Clear;
      qry_movimento.SQL.Add('UPDATE LEITURA_CPFL SET VALOR=:VALOR WHERE CODIGO_CPFL=:CODIGO_CPFL');
      qry_movimento.ParamByName('CODIGO_CPFL').AsString := edtCodigo.Text;
      qry_movimento.ParamByName('VALOR').AsFloat        := edt_valor.Value;

     cboLugar.ReadOnly:=false;
     edt_data.ReadOnly:= false;
     edtLeitura.ReadOnly:=false;

  end;
  qry_movimento.ExecSQL;
  IBTRANSLOCAL.Commit;

  cboLugar.keyvalue := -1;
  edt_Data.Clear;
  edtLeitura.Clear;
  edt_valor.Clear;
  edtCodigo.Clear;  

end;

procedure TfrmLeituraCPFL.FormShow(Sender: TObject);
begin
  qryLugar.Close;
  qryLugar.SQL.Clear;
  qryLugar.SQL.Add('SELECT CPFL_CODIGO ||'' - ''|| CPFL_LUGAR AS LUGAR, '+
      'CPFL_CODIGO             '+
      'FROM CAD_LUGAR_LEITURA_CPFL       ');
  qryLugar.open;
  qryLugar.fetchall;

  cboLugar.SetFocus;
end;

procedure TfrmLeituraCPFL.btnPesquisarClick(Sender: TObject);
var
  dta, data1, data2, lugar, mensagem : string;
begin

  data1 := Copy(edtDataInicial.Text,4,3) + Copy(edtDataInicial.Text,1,3) + Copy(edtDataInicial.Text,7,4) + ' 00:00:00';
  data2 := Copy(edtDataFinal.Text,4,3) + Copy(edtDataFinal.Text,1,3) + Copy(edtDataFinal.Text,7,4) + ' 23:59:59';

  if (edtDataInicial.Text <> '  /  /    ') and (edtDataFinal.Text <> '  /  /    ') then
    dta := ' AND DATA BETWEEN '+ #39 + data1 + #39 + ' AND '+ #39 + data2 + #39
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

  if cboPesqLugar.Text <> '' then
    lugar := ' AND C.cpfl_codigo = ' + IntToStr(cboPesqLugar.KeyValue)
  else
    lugar := '';

  qryPesquisa.close;
  qryPesquisa.SQL.Clear;
  qryPesquisa.SQL.Add(' SELECT DATA, NUMERO_LEITURA, VALOR, KWH, NUMERO_LEITURA_ANTERIOR, '+
                      ' C.cpfl_codigo ||'' - ''|| C.cpfl_lugar AS LUGAR, CODIGO_CPFL, C.CPFL_CODIGO,        '+
                      ' case                                                                                '+
                      ' when NUMERO_LEITURA_ANTERIOR > 0 THEN                                               '+
                      ' SUM( (NUMERO_LEITURA -NUMERO_LEITURA_ANTERIOR) * 10 )                               '+
                      ' ELSE                                                                                '+
                      '   0                                                                                 '+
                      ' END  KWHX10                                                                         '+
                      ' FROM LEITURA_CPFL L INNER join cad_lugar_leitura_cpfl C ON                          '+
                      ' L.cpfl_codigo = C.cpfl_codigo                                                       '+
                      ' where 1=1 '+ dta + lugar +
                      ' GROUP BY DATA, NUMERO_LEITURA, VALOR, KWH, NUMERO_LEITURA_ANTERIOR,                 '+
                      ' C.cpfl_codigo, C.cpfl_lugar, CODIGO_CPFL                                            ');
  qryPesquisa.Open;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT SUM(KWH) AS KWH FROM LEITURA_CPFL C '+
                 ' WHERE 1=1 '+ dta + lugar                   );
  qryAux.Open;

  if not qryPesquisa.IsEmpty then
    edtMedia.Value:= qryAux.fieldbyname('KWH').AsInteger /qryPesquisa.RecordCount;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT SUM(VALOR) AS VALOR FROM LEITURA_CPFL C '+
     ' WHERE 1=1 '+ dta + lugar );
  qryAux.Open;

  edtTotal.Value := qryAux.fieldbyname('VALOR').AsFloat;



end;

procedure TfrmLeituraCPFL.grd1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (gdSelected in state) then
  begin
    with (Sender as TDBGrid).Canvas do
    begin
      Font.Style  := [fsbold];
      grd1.Canvas.Brush.Color := clWhite;
    end;
  end;  

  grd1.Canvas.Font.Color:= clBlack;

  grd1.Canvas.FillRect(Rect);
  grd1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmLeituraCPFL.grd1TitleClick(Column: TColumn);
var 
  dta, data1, data2, lugar, campo, mensagem : string;
begin

  campo := column.fieldname; // CAMPO RECEBE O NOME DA COLUNA CLICADA,
  application.processmessages; // para considerar algo que aconteça no dbgrid durante a entrada nesta procedure


  if (campo = 'DATA') or (campo = 'NUMERO_LEITURA') OR (campo = 'NUMERO_LEITURA_ANTERIOR')
  or (campo = 'KWH') or (campo = 'VALOR') then
    campo := 'L.' + campo
  else if (campo = 'LUGAR') Then
    campo := 'C.cpfl_codigo '
  else
    campo := '' + campo ;

  data1 := Copy(edtDataInicial.Text,4,3) + Copy(edtDataInicial.Text,1,3) + Copy(edtDataInicial.Text,7,4) + ' 00:00:00';
  data2 := Copy(edtDataFinal.Text,4,3) + Copy(edtDataFinal.Text,1,3) + Copy(edtDataFinal.Text,7,4) + ' 23:59:59';

  if (edtDataInicial.Text <> '  /  /    ') and (edtDataFinal.Text <> '  /  /    ') then
    dta := ' AND DATA BETWEEN '+ #39 + data1 + #39 + ' AND '+ #39 + data2 + #39
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

  if cboLugar.Text <> '' then
    lugar := ' AND C.CPFL_CODIGO = ' + IntToStr(cboLugar.KeyValue)
  else
    lugar := '';   

  qryPesquisa.close;
  qryPesquisa.SQL.Clear;
  qryPesquisa.SQL.Add(' SELECT DATA, NUMERO_LEITURA, VALOR, KWH, NUMERO_LEITURA_ANTERIOR,                   '+
                      ' C.cpfl_codigo ||'' - ''|| C.cpfl_lugar AS LUGAR, CODIGO_CPFL, C.CPFL_CODIGO,        '+
                      ' case                                                                                '+
                      ' when NUMERO_LEITURA_ANTERIOR > 0 THEN                                               '+
                      ' SUM( (NUMERO_LEITURA -NUMERO_LEITURA_ANTERIOR) * 10 )                               '+
                      ' ELSE                                                                                '+
                      '   0                                                                                 '+
                      ' END  KWHX10                                                                         '+
                      ' FROM LEITURA_CPFL L INNER join cad_lugar_leitura_cpfl C ON                          '+
                      ' L.cpfl_codigo = C.cpfl_codigo                                                       '+
                      ' where 1=1 '+ dta + lugar +
                      ' GROUP BY DATA, NUMERO_LEITURA, VALOR, KWH, NUMERO_LEITURA_ANTERIOR,                 '+
                      ' C.cpfl_codigo, C.cpfl_lugar, CODIGO_CPFL, C.CPFL_CODIGO                             '+
                      ' order by ' + campo                                                                  );
  qryPesquisa.Open;


end;

procedure TfrmLeituraCPFL.edtLeituraKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', #13, #8, #7]) Then
    key:= #0;
  If (key = #13) then
  Begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmLeituraCPFL.grd1DblClick(Sender: TObject);
begin
  case MessageBox (Application.Handle, Pchar ('Tem certeza que deseja alterar o registro?'),'Alerta', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1) of
  IDYES:
  begin
    edtCodigo.Text:= qryPesquisa.fieldbyname('CODIGO_CPFL').AsString;

    cboLugar.KeyValue:= qryPesquisa.fieldbyname('CPFL_CODIGO').AsString;
    edt_data.Text := qryPesquisa.fieldbyname('DATA').AsString;
    edtLeitura.Text := qryPesquisa.fieldbyname('NUMERO_LEITURA').AsString;
    edt_Valor.Value := qryPesquisa.fieldbyname('valor').AsFloat;
    cboLugar.ReadOnly:=True;
    edt_data.ReadOnly:= True;
    edtLeitura.ReadOnly:=True;

  end;
  end;

end;

end.
