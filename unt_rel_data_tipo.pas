unit unt_rel_data_tipo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DB, ADODB, Grids, DBGrids, ToolEdit, CurrEdit,
  IBCustomDataSet, IBQuery, DBCtrls, ExtCtrls;

type
  Tfrm_rel_data_tipo = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    txt_despesa_outros: TEdit;
    GroupBox2: TGroupBox;
    cbo_segunda: TComboBox;
    cbo_terca: TComboBox;
    cbo_quarta: TComboBox;
    cbo_quinta: TComboBox;
    cbo_sexta: TComboBox;
    cbo_sabado: TComboBox;
    cbo_domingo: TComboBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    DBGrid1: TDBGrid;
    Label5: TLabel;
    txt_data_i: TDateEdit;
    txt_data_f: TDateEdit;
    Label6: TLabel;
    txt_total: TCurrencyEdit;
    qry_pesquisa: TIBQuery;
    ds_pesquisa: TDataSource;
    qry_soma: TIBQuery;
    rdb_inicio: TRadioButton;
    rdb_posicao: TRadioButton;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    cboDespesa: TDBLookupComboBox;
    qryDespesa: TIBQuery;
    dsDespesa: TDataSource;
    qry_pesquisaCODIGO: TIntegerField;
    qry_pesquisaDESPESA_OUTROS: TIBStringField;
    qry_pesquisaVALOR: TIBBCDField;
    qry_pesquisaDATA: TDateTimeField;
    qry_pesquisaSEMANA: TIBStringField;
    qry_pesquisaDESPESA: TIBStringField;
    btnRelatorio: TButton;
    qryDespesaTIP_CODIGO_SIT: TIntegerField;
    qryDespesaTIP_DESCRICAO_SIT: TIBStringField;
    qryDespesaDESPESA: TIBStringField;
    rdg_organizado: TRadioGroup;
    qry_pesquisaCONTAS_PAGAR_ID: TIntegerField;
    procedure txt_data_iEnter(Sender: TObject);
    procedure txt_data_iExit(Sender: TObject);
    procedure txt_data_iKeyPress(Sender: TObject; var Key: Char);
    procedure txt_data_fEnter(Sender: TObject);
    procedure txt_data_fExit(Sender: TObject);
    procedure txt_data_fKeyPress(Sender: TObject; var Key: Char);
    procedure txt_despesa_outrosEnter(Sender: TObject);
    procedure txt_despesa_outrosExit(Sender: TObject);
    procedure txt_despesa_outrosKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cboDespesaEnter(Sender: TObject);
    procedure cboDespesaExit(Sender: TObject);
    procedure cboDespesaKeyPress(Sender: TObject; var Key: Char);
    procedure btnRelatorioClick(Sender: TObject);
    procedure cboDespesaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_rel_data_tipo: Tfrm_rel_data_tipo;

implementation

uses unt_modulo,  untRelCadDespesa;

{$R *.dfm}

procedure Tfrm_rel_data_tipo.txt_data_iEnter(Sender: TObject);
begin
  txt_data_i.Color := $00F5EEDE;
end;

procedure Tfrm_rel_data_tipo.txt_data_iExit(Sender: TObject);
begin
  txt_data_i.Color := clwindow;
end;

procedure Tfrm_rel_data_tipo.txt_data_iKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then txt_data_f.SetFocus;
end;

procedure Tfrm_rel_data_tipo.txt_data_fEnter(Sender: TObject);
begin
  txt_data_f.Color := $00F5EEDE;
end;

procedure Tfrm_rel_data_tipo.txt_data_fExit(Sender: TObject);
begin
  txt_data_f.Color := clwindow;
end;

procedure Tfrm_rel_data_tipo.txt_data_fKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    cboDespesa.SetFocus;
end;

procedure Tfrm_rel_data_tipo.txt_despesa_outrosEnter(Sender: TObject);
begin
  txt_despesa_outros.Color := $00F5EEDE;
end;

procedure Tfrm_rel_data_tipo.txt_despesa_outrosExit(Sender: TObject);
begin
  txt_despesa_outros.Color := clwindow;
end;

procedure Tfrm_rel_data_tipo.txt_despesa_outrosKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then
    button1.SetFocus;
end;

procedure Tfrm_rel_data_tipo.FormShow(Sender: TObject);
begin
  txt_data_i.SetFocus;
  rdb_inicio.Checked := TRUE;

  qryDespesa.Close;
  qryDespesa.SQL.Clear;
  qryDespesa.SQL.Add('SELECT TIP_CODIGO_SIT, TIP_DESCRICAO_SIT, TIP_CODIGO_SIT ||'+#39+' - '+#39+'|| TIP_DESCRICAO_SIT AS DESPESA FROM TIPO_DESPESA_SITIO');
  qryDespesa.Open;
  qryDespesa.FetchAll;

end;

procedure Tfrm_rel_data_tipo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frm_rel_data_tipo := nil;
  action:= cafree;
end;

procedure Tfrm_rel_data_tipo.Button1Click(Sender: TObject);
var
  dta, data1, data2, despesa, despesa_outros, mensagem, ordenar : string;
  segunda, terca, quarta, quinta, sexta, sabado, domingo : string;

begin


  data1 := Copy(txt_data_i.Text,4,3) + Copy(txt_data_i.Text,1,3) + Copy(txt_data_i.Text,7,4) + ' 00:00:00';
  data2 := Copy(txt_data_f.Text,4,3) + Copy(txt_data_f.Text,1,3) + Copy(txt_data_f.Text,7,4) + ' 23:59:59';

  if (txt_data_i.Text <> '  /  /    ') and (txt_data_f.Text <> '  /  /    ') then
    dta := ' AND CA.DATA BETWEEN '+ #39 + data1 + #39 + ' AND '+ #39 + data2 + #39
  else
    dta := '';

  if ((txt_data_i.Text <> '  /  /    ') and (txt_data_f.Text = '  /  /    ') or (txt_data_i.Text = '  /  /    ') and (txt_data_f.Text <> '  /  /    '))  then
  begin
    mensagem := 'Informe Intervalo de Datas !';
    Application.MessageBox(Pchar(mensagem), 'Informação', MB_OK+MB_ICONWARNING);
    txt_data_i.SetFocus;
    exit;
  end;

  if cboDespesa.Text <> '' then
    despesa := ' AND CA.TIP_CODIGO_SIT = ' + IntToStr(cboDespesa.KeyValue)
  else
    despesa := '';

  if (txt_despesa_outros.Text <> '') and (rdb_inicio.Checked = TRUE) then
    despesa_outros  := ' AND UPPER(CA.DESPESA_OUTROS) LIKE UPPER('+ #39 + txt_despesa_outros.Text + '%' + #39 + ')'
  else if (txt_despesa_outros.Text <> '') and (rdb_posicao.Checked = TRUE) then
    despesa_outros  := ' AND UPPER(CA.DESPESA_OUTROS) LIKE UPPER('+ #39 + '%' + txt_despesa_outros.Text + '%' + #39 + ')'
  else
    despesa_outros  := '';

  if cbo_segunda.Text <> '' then
    segunda := ' AND CA.SEMANA LIKE UPPER('+ #39 + cbo_segunda.Text + '%' + #39 +')'
  else
    segunda := '';

  if cbo_terca.Text <> '' then
    terca := ' AND CA.SEMANA LIKE UPPER('+ #39 + cbo_terca.Text + '%' + #39 +')'
  else
    terca := '';

  if cbo_quarta.Text <> '' then
    quarta := ' AND CA.SEMANA LIKE UPPER('+ #39 + cbo_quarta.Text + '%' + #39 +')'
  else
    quarta := '';

  if cbo_quinta.Text <> '' then
    quinta := ' AND CA.SEMANA LIKE UPPER('+ #39 + cbo_quinta.Text + '%' + #39 +')'
  else
    quinta := '';

  if cbo_sexta.Text <> '' then
    sexta := ' AND CA.SEMANA LIKE UPPER('+ #39 + cbo_sexta.Text + '%' + #39 +')'
  else
    sexta := '';

  if cbo_sabado.Text <> '' then
    sabado := ' AND CA.SEMANA LIKE UPPER('+ #39 + cbo_sabado.Text + '%' + #39 +')'
  else
    sabado := '';


  if cbo_domingo.Text <> '' then
    domingo := ' AND CA.SEMANA LIKE UPPER('+ #39 + cbo_domingo.Text + '%' + #39 +')'
  else
    domingo := '';

  qry_pesquisa.Close;
  qry_pesquisa.SQL.Clear;
  qry_pesquisa.SQL.Add('SELECT CA.codigo, CA.despesa_outros, CA.valor, CA.data, CA.semana, CA.CONTAS_PAGAR_ID,  '+
                       'T.tip_codigo_sit ||'+#39+' - '+#39+'|| T.tip_descricao_sit AS DESPESA                   '+
                       'FROM CAD_DESPESA_SITIO CA, TIPO_DESPESA_SITIO T                                         '+
                       'WHERE T.tip_codigo_sit=CA.tip_codigo_sit ' +  dta + despesa + despesa_outros             +
                       '' + segunda + terca + quarta + quinta + sexta + sabado + domingo                        );
  qry_pesquisa.Open;
  qry_pesquisa.FetchAll;

  qry_soma.Close;
  qry_soma.SQL.Clear;
  qry_soma.SQL.Add('SELECT SUM(CA.VALOR) AS TOTAL FROM CAD_DESPESA_SITIO CA, TIPO_DESPESA_SITIO T WHERE T.tip_codigo_sit=CA.tip_codigo_sit '+
                       '' + dta + despesa + despesa_outros +
                       '' + segunda + terca + quarta + quinta + sexta + sabado + domingo);
  qry_soma.Open;
  qry_soma.FetchAll;

  txt_total.Text := formatfloat('###,##0.00', qry_soma.fieldbyname('TOTAL').AsFloat);


end;

procedure Tfrm_rel_data_tipo.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (gdSelected in state) then
  begin
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := clMenuHighlight;
      Font.Style  := [fsbold];
      Font.Color  := clWhite
    end
  end
  else
     dbgrid1.Canvas.Font.Color:= clBlack;

   dbgrid1.Canvas.FillRect(Rect);
   dbgrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure Tfrm_rel_data_tipo.cboDespesaEnter(Sender: TObject);
begin
  cboDespesa.Color := $00F5EEDE;
end;

procedure Tfrm_rel_data_tipo.cboDespesaExit(Sender: TObject);
begin
  cboDespesa.Color := clwindow;
end;

procedure Tfrm_rel_data_tipo.cboDespesaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_despesa_outros.SetFocus;
end;

procedure Tfrm_rel_data_tipo.btnRelatorioClick(Sender: TObject);
var
  dta, data1, data2, despesa, despesa_outros, mensagem, ordenar : string;
  segunda, terca, quarta, quinta, sexta, sabado, domingo : string;

begin
  if qry_pesquisa.IsEmpty then
    exit;

  data1 := Copy(txt_data_i.Text,4,3) + Copy(txt_data_i.Text,1,3) + Copy(txt_data_i.Text,7,4) + ' 00:00:00';
  data2 := Copy(txt_data_f.Text,4,3) + Copy(txt_data_f.Text,1,3) + Copy(txt_data_f.Text,7,4) + ' 23:59:59';

  if (txt_data_i.Text <> '  /  /    ') and (txt_data_f.Text <> '  /  /    ') then
    dta := ' AND CA.DATA BETWEEN '+ #39 + data1 + #39 + ' AND '+ #39 + data2 + #39
  else
    dta := '';

  if ((txt_data_i.Text <> '  /  /    ') and (txt_data_f.Text = '  /  /    ') or (txt_data_i.Text = '  /  /    ') and (txt_data_f.Text <> '  /  /    '))  then
  begin
    mensagem := 'Informe Intervalo de Datas !';
    Application.MessageBox(Pchar(mensagem), 'Informação', MB_OK+MB_ICONWARNING);
    txt_data_i.SetFocus;
    exit;
  end;

  if cboDespesa.Text <> '' then
    despesa := ' AND CA.TIP_CODIGO_SIT = ' + IntToStr(cboDespesa.KeyValue)
  else
    despesa := '';

  if (txt_despesa_outros.Text <> '') and (rdb_inicio.Checked = TRUE) then
    despesa_outros  := ' AND UPPER(CA.DESPESA_OUTROS) LIKE UPPER('+ #39 + txt_despesa_outros.Text + '%' + #39 + ')'
  else if (txt_despesa_outros.Text <> '') and (rdb_posicao.Checked = TRUE) then
    despesa_outros  := ' AND UPPER(CA.DESPESA_OUTROS) LIKE UPPER('+ #39 + '%' + txt_despesa_outros.Text + '%' + #39 + ')'
  else
    despesa_outros  := '';

  if rdg_organizado.ItemIndex = 0 then
  begin
    frmRelCadDespesa.qry_pesquisa.Close;
    frmRelCadDespesa.qry_pesquisa.SQL.Clear;
    frmRelCadDespesa.qry_pesquisa.SQL.Add('SELECT EXTRACT(month FROM CA.DATA) AS MES, EXTRACT(YEAR FROM CA.DATA) AS ANO,                         '+
                                          'TD.TIP_CODIGO_SIT ||'+#39+' - '+#39+'|| TD.TIP_DESCRICAO_SIT AS DESCR, CA.CODIGO,                     '+
                                          'CA.DATA, CA.VALOR, CA.SEMANA, CA.DESPESA_OUTROS                                                       '+
                                          'FROM CAD_DESPESA_SITIO CA, TIPO_DESPESA_SITIO TD where TD.TIP_CODIGO_SIT = CA.TIP_CODIGO_SIT          '+
                                          ''+  dta + despesa + despesa_outros                                                                     +
                                          'GROUP BY EXTRACT(MONTH FROM CA.DATA), EXTRACT(YEAR FROM CA.DATA), CA.DATA, CA.VALOR, CA.SEMANA,       '+
                                          'CA.DESPESA_OUTROS, TD.tip_descricao_SIT, TD.tip_codigo_SIT, CA.CODIGO                                 '+
                                          '' + ordenar                                                                                            );
    frmRelCadDespesa.qry_pesquisa.Open;
    frmRelCadDespesa.qry_pesquisa.FetchAll;

    if frmRelCadDespesa.qry_pesquisa.isempty then
    begin
      mensagem := 'Registro nao encontrado !';
      Application.MessageBox(Pchar(mensagem), 'Informação', MB_OK+MB_ICONWARNING);
      txt_data_i.SetFocus;
      exit;
    end;

    frmRelCadDespesa.lbl_data.caption := txt_data_i.Text + ' a ' + txt_data_f.Text;

    frmRelCadDespesa.frRelatorio.Prepare;
    frmRelCadDespesa.frRelatorio.PreviewModal;

  end
  else
  begin
    frmRelCadDespesa.qryPesquisaAno.Close;
    frmRelCadDespesa.qryPesquisaAno.SQL.Clear;
    frmRelCadDespesa.qryPesquisaAno.SQL.Add('SELECT EXTRACT(YEAR FROM CA.DATA) AS ANO,                                                             '+
                                            'TD.TIP_CODIGO_SIT ||'+#39+' - '+#39+'|| TD.TIP_DESCRICAO_SIT AS DESCR, CA.CODIGO,                     '+
                                            'CA.DATA, CA.VALOR, CA.SEMANA, CA.DESPESA_OUTROS                                                       '+
                                            'FROM CAD_DESPESA_SITIO CA, TIPO_DESPESA_SITIO TD where TD.TIP_CODIGO_SIT = CA.TIP_CODIGO_SIT          '+
                                            ''+  dta + despesa + despesa_outros + segunda + terca + quarta + quinta + sexta + sabado + domingo      +
                                            'GROUP BY  EXTRACT(YEAR FROM CA.DATA), CA.DATA, CA.VALOR, CA.SEMANA, CA.DESPESA_OUTROS,                '+
                                            'TD.tip_descricao_SIT, TD.tip_codigo_SIT, CA.CODIGO                                                    '+
                                            '' + ordenar                                                                                            );
    frmRelCadDespesa.qryPesquisaAno.Open;
    frmRelCadDespesa.qryPesquisaAno.FetchAll;

    if frmRelCadDespesa.qryPesquisaAno.isempty then
    begin
      mensagem := 'Registro nao encontrado !';
      Application.MessageBox(Pchar(mensagem), 'Informação', MB_OK+MB_ICONWARNING);
      txt_data_i.SetFocus;
      exit;
    end;

    frmRelCadDespesa.lbl_data_ano.caption := txt_data_i.Text + ' a ' + txt_data_f.Text;

    frmRelCadDespesa.frRelatorioAno.Prepare;
    frmRelCadDespesa.frRelatorioAno.PreviewModal;
  end;


end;

procedure Tfrm_rel_data_tipo.cboDespesaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_Back then
    cboDespesa.KeyValue := NULL;
end;

procedure Tfrm_rel_data_tipo.DBGrid1TitleClick(Column: TColumn);
VAR
  campo : string;
  dta, data1, data2, despesa, despesa_outros, mensagem, ordenar : string;
  segunda, terca, quarta, quinta, sexta, sabado, domingo, despesa_sub : string;
begin
  if qry_pesquisa.IsEmpty then
    exit;

  campo := column.fieldname; // CAMPO RECEBE O NOME DA COLUNA CLICADA,
  application.processmessages; // para considerar algo que aconteça no dbgrid durante a entrada nesta procedure

  if (campo = 'codigo') or (campo = 'despesa_outros') or (campo = 'valor') or
  (campo = 'data') or (campo = 'semana') or (campo = 'contas_pagar_id')  then
    campo := 'CA.' + campo
  else if (campo = 'DESPESA') Then
    campo := 'T.tip_codigo_SIT '
  else
    campo := '' + campo ;

  data1 := Copy(txt_data_i.Text,4,3) + Copy(txt_data_i.Text,1,3) + Copy(txt_data_i.Text,7,4) + ' 00:00:00';
  data2 := Copy(txt_data_f.Text,4,3) + Copy(txt_data_f.Text,1,3) + Copy(txt_data_f.Text,7,4) + ' 23:59:59';

  if (txt_data_i.Text <> '  /  /    ') and (txt_data_f.Text <> '  /  /    ') then
    dta := ' AND CA.DATA BETWEEN '+ #39 + data1 + #39 + ' AND '+ #39 + data2 + #39
  else
    dta := '';

  if ((txt_data_i.Text <> '  /  /    ') and (txt_data_f.Text = '  /  /    ') or (txt_data_i.Text = '  /  /    ') and (txt_data_f.Text <> '  /  /    '))  then
  begin
    mensagem := 'Informe Intervalo de Datas !';
    Application.MessageBox(Pchar(mensagem), 'Informação', MB_OK+MB_ICONWARNING);
    txt_data_i.SetFocus;
    exit;
  end;

  if cboDespesa.Text <> '' then
    despesa := ' AND CA.TIP_CODIGO_SIT = ' + IntToStr(cboDespesa.KeyValue)
  else
    despesa := '';

  if (txt_despesa_outros.Text <> '') and (rdb_inicio.Checked = TRUE) then
    despesa_outros  := ' AND UPPER(CA.DESPESA_OUTROS) LIKE UPPER('+ #39 + txt_despesa_outros.Text + '%' + #39 + ')'
  else if (txt_despesa_outros.Text <> '') and (rdb_posicao.Checked = TRUE) then
    despesa_outros  := ' AND UPPER(CA.DESPESA_OUTROS) LIKE UPPER('+ #39 + '%' + txt_despesa_outros.Text + '%' + #39 + ')'
  else
    despesa_outros  := '';

  if cbo_segunda.Text <> '' then
    segunda := ' AND CA.SEMANA LIKE UPPER('+ #39 + cbo_segunda.Text + '%' + #39 +')'
  else
    segunda := '';

  if cbo_terca.Text <> '' then
    terca := ' AND CA.SEMANA LIKE UPPER('+ #39 + cbo_terca.Text + '%' + #39 +')'
  else
    terca := '';

  if cbo_quarta.Text <> '' then
    quarta := ' AND CA.SEMANA LIKE UPPER('+ #39 + cbo_quarta.Text + '%' + #39 +')'
  else
    quarta := '';

  if cbo_quinta.Text <> '' then
    quinta := ' AND CA.SEMANA LIKE UPPER('+ #39 + cbo_quinta.Text + '%' + #39 +')'
  else
    quinta := '';

  if cbo_sexta.Text <> '' then
    sexta := ' AND CA.SEMANA LIKE UPPER('+ #39 + cbo_sexta.Text + '%' + #39 +')'
  else
    sexta := '';

  if cbo_sabado.Text <> '' then
    sabado := ' AND CA.SEMANA LIKE UPPER('+ #39 + cbo_sabado.Text + '%' + #39 +')'
  else
    sabado := '';

  if cbo_domingo.Text <> '' then
    domingo := ' AND CA.SEMANA LIKE UPPER('+ #39 + cbo_domingo.Text + '%' + #39 +')'
  else
    domingo := '';

  qry_pesquisa.Close;
  qry_pesquisa.SQL.Clear;
  qry_pesquisa.SQL.Add('SELECT CA.codigo, CA.despesa_outros, CA.valor, CA.data, CA.semana, CA.CONTAS_PAGAR_ID,  '+
                       'T.tip_codigo_sit ||'+#39+' - '+#39+'|| T.tip_descricao_sit AS DESPESA                   '+
                       'FROM CAD_DESPESA_SITIO CA, TIPO_DESPESA_SITIO T                                         '+
                       'WHERE T.tip_codigo_sit=CA.tip_codigo_sit ' +  dta + despesa + despesa_outros             +
                       '' + segunda + terca + quarta + quinta + sexta + sabado + domingo + ' ORDER BY ' + campo  );
  qry_pesquisa.Open;
  qry_pesquisa.FetchAll;

  qry_soma.Close;
  qry_soma.SQL.Clear;
  qry_soma.SQL.Add('SELECT SUM(CA.VALOR) AS TOTAL FROM CAD_DESPESA_SITIO CA, TIPO_DESPESA_SITIO T WHERE T.tip_codigo_sit=CA.tip_codigo_sit  '+
                   '' + dta + despesa + despesa_outros                                                                                       +
                   '' + segunda + terca + quarta + quinta + sexta + sabado + domingo                                                         );
  qry_soma.Open;
  qry_soma.FetchAll;

  txt_total.Text := formatfloat('###,##0.00', qry_soma.fieldbyname('TOTAL').AsFloat);

end;

end.
