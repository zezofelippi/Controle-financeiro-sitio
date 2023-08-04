unit untListDespRec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, ExtCtrls, DBCtrls, DB,
  IBCustomDataSet, IBQuery;

type
  TfrmListDespRec = class(TForm)
    Label1: TLabel;
    txt_data_i: TDateEdit;
    txt_data_f: TDateEdit;
    Label2: TLabel;
    Button1: TButton;
    rdg_agrupado: TRadioGroup;
    Label3: TLabel;
    cboDespesa: TDBLookupComboBox;
    cboReceita: TDBLookupComboBox;
    Label4: TLabel;
    qryDespesa: TIBQuery;
    qryReceita: TIBQuery;
    dsDespesa: TDataSource;
    dsReceita: TDataSource;
    qryReceitaCODIGO: TIntegerField;
    qryReceitaREC: TIBStringField;
    qryDespesaTIP_CODIGO_SIT: TIntegerField;
    qryDespesaTIP_DESCRICAO_SIT: TIBStringField;
    qryDespesaDESPESA: TIBStringField;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cboDespesaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cboReceitaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txt_data_iEnter(Sender: TObject);
    procedure txt_data_iExit(Sender: TObject);
    procedure txt_data_fEnter(Sender: TObject);
    procedure txt_data_fExit(Sender: TObject);
    procedure cboDespesaEnter(Sender: TObject);
    procedure cboDespesaExit(Sender: TObject);
    procedure cboReceitaEnter(Sender: TObject);
    procedure cboReceitaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListDespRec: TfrmListDespRec;

implementation

uses untRelRecDesp, unt_modulo;

{$R *.dfm}

procedure TfrmListDespRec.Button1Click(Sender: TObject);
var
  mensagem, data1, data2, dta, tipo, receita, despesa : string;
  num_rec, num_desp : integer;

begin
  if (txt_data_i.Text ='  /  /    ') and (txt_data_f.Text = '  /  /    ') then
  begin
    mensagem := 'Informe uma Data !';
    Application.MessageBox(Pchar(mensagem), 'Informação', MB_OK+MB_ICONWARNING);
    txt_data_i.SetFocus;
    exit;
  end;

  if (cboDespesa.KeyValue = NULL ) and (cboREceita.KeyValue <> NULL) then
  begin
    mensagem := 'Informe Receita e Despesa !';
    Application.MessageBox(Pchar(mensagem), 'Informação', MB_OK+MB_ICONWARNING);
    cboDespesa.SetFocus;
    exit;
  end;

  if (cboDespesa.KeyValue <> NULL ) and (cboREceita.KeyValue = NULL) then
  begin
    mensagem := 'Informe Receita e Despesa !';
    Application.MessageBox(Pchar(mensagem), 'Informação', MB_OK+MB_ICONWARNING);
    cboREceita.SetFocus;
    exit;
  end;

  data1 := Copy(txt_data_i.Text,4,3) + Copy(txt_data_i.Text,1,3) + Copy(txt_data_i.Text,7,4) + ' 00:00:00';
  data2 := Copy(txt_data_f.Text,4,3) + Copy(txt_data_f.Text,1,3) + Copy(txt_data_f.Text,7,4) + ' 23:59:59';

  if (txt_data_i.Text <> '  /  /    ') and (txt_data_f.Text <> '  /  /    ') then
    dta := 'WHERE D.DATA BETWEEN '+ #39 + data1 + #39 + ' AND '+ #39 + data2 + #39
  else
    dta := '';

  if (cboDespesa.KeyValue <> NULL ) and (cboREceita.KeyValue <> NULL) then
  begin
    receita := ' AND CODIGO = ' + IntToStr(cboReceita.KeyValue);
    despesa := ' AND TIP_CODIGO_SIT = ' + IntToStr(cboDespesa.KeyValue);

    frmRelRecDesp.lbl_receita_despesa.caption := 'Recebimento : ' + cboReceita.Text + '    X     Despesa : ' + cboDespesa.Text;
    frmRelRecDesp.lbl_receita_despesa_ano.caption := 'Recebimento : ' + cboReceita.Text + '    X     Despesa : ' + cboDespesa.Text;
  end
  else
  begin
    receita := '';
    despesa := '';
    frmRelRecDesp.lbl_receita_despesa.caption := '';
    frmRelRecDesp.lbl_receita_despesa_ano.caption := '';
  end;

  if ((txt_data_i.Text <> '  /  /    ') and (txt_data_f.Text = '  /  /    ') or (txt_data_i.Text = '  /  /    ') and (txt_data_f.Text <> '  /  /    '))  then
  begin
    mensagem := 'Informe Intervalo de Datas !';
    Application.MessageBox(Pchar(mensagem), 'Informação', MB_OK+MB_ICONWARNING);
    txt_data_i.SetFocus;
    exit;
  end;

  if rdg_agrupado.ItemIndex = 0 then
  begin
    frmRelRecDesp.lbl_data.Caption := 'Periodo de : ' + txt_Data_i.Text + ' a ' + txt_data_f.Text;

    frmRelRecDesp.qry_pesquisa.Close;
    frmRelRecDesp.qry_pesquisa.SQL.Clear;
    frmRelRecDesp.qry_pesquisa.SQL.Add('SELECT EXTRACT(YEAR FROM DATA) AS ANO, EXTRACT(MONTH FROM DATA) AS MES            '+
                                       'FROM CAD_DESPESA_SITIO                                                            '+
                                       'WHERE  DATA BETWEEN :DATA1 AND :DATA2 ' + despesa                                  +
                                       'group by EXTRACT(YEAR FROM DATA), EXTRACT(MONTH FROM DATA)                        '+
                                       'union                                                                             '+
                                       'SELECT EXTRACT(YEAR FROM DATA) AS ANO, EXTRACT(MONTH FROM DATA) AS MES            '+
                                       'FROM ITENS_RECEITAS_SITIO                                                         '+
                                       'WHERE  DATA BETWEEN :DATA1 AND :DATA2 ' + receita                                  +
                                       'group by EXTRACT(YEAR FROM DATA), EXTRACT(MONTH FROM DATA) ORDER BY 1, 2          ');
    frmRelRecDesp.qry_pesquisa.ParamByName('DATA1').AsDateTime := txt_data_i.Date;
    frmRelRecDesp.qry_pesquisa.ParamByName('DATA2').AsDateTime := txt_data_f.Date;
    frmRelRecDesp.qry_pesquisa.Open;

    if frmRelRecDesp.qry_pesquisa.isempty then
    begin
      mensagem := 'Registro nao encontrado !';
      Application.MessageBox(Pchar(mensagem), 'Informação', MB_OK+MB_ICONWARNING);
      txt_data_i.SetFocus;
      exit;
    end;

    frmRelRecDesp.frRelatorio.Prepare;
    frmRelRecDesp.frRelatorio.PreviewModal;

    end
    else if rdg_agrupado.ItemIndex = 1 then
    begin
      frmRelRecDesp.lbl_data_ano.Caption := 'Periodo de : ' + txt_Data_i.Text + ' a ' + txt_data_f.Text;

      frmRelRecDesp.qry_pesquisa_ano.Close;
      frmRelRecDesp.qry_pesquisa_ano.SQL.Clear;
      frmRelRecDesp.qry_pesquisa_ano.SQL.Add('SELECT EXTRACT(YEAR FROM DATA) AS ANO                '+
                                             'FROM CAD_DESPESA_SITIO                               '+
                                             'WHERE  DATA BETWEEN :DATA1 AND :DATA2 ' + despesa     +
                                             'group by EXTRACT(YEAR FROM DATA), COD_ANO            '+
                                             'union                                                '+
                                             'SELECT EXTRACT(YEAR FROM DATA) AS ANO                '+
                                             'FROM ITENS_RECEITAS_SITIO                            '+
                                             'WHERE  DATA BETWEEN :DATA1 AND :DATA2 ' + receita     +
                                             'group by EXTRACT(YEAR FROM DATA) order by 1          ');
      frmRelRecDesp.qry_pesquisa_ano.ParamByName('DATA1').AsDateTime := txt_data_i.Date;
      frmRelRecDesp.qry_pesquisa_ano.ParamByName('DATA2').AsDateTime := txt_data_f.Date;

      frmRelRecDesp.qry_pesquisa_ano.Open;

      if frmRelRecDesp.qry_pesquisa_ano.isempty then
      begin
        mensagem := 'Registro nao encontrado !';
        Application.MessageBox(Pchar(mensagem), 'Informação', MB_OK+MB_ICONWARNING);
        txt_data_i.SetFocus;
        exit;
      end;

      frmRelRecDesp.frRelatorioAno.Prepare;
      frmRelRecDesp.frRelatorioAno.PreviewModal;

    end;

end;

procedure TfrmListDespRec.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmListDespRec := nil;
  action:= cafree;
end;

procedure TfrmListDespRec.FormShow(Sender: TObject);
begin

  qryDespesa.Close;
  qryDespesa.SQL.Clear;
  qryDespesa.SQL.Add('SELECT TIP_CODIGO_SIT, TIP_DESCRICAO_SIT, TIP_CODIGO_SIT ||'+#39+' - '+#39+'|| TIP_DESCRICAO_SIT AS DESPESA FROM TIPO_DESPESA_SITIO');
  qryDespesa.Open;
  qryDespesa.FetchAll;

  qryReceita.Close;
  qryReceita.SQL.Clear;
  qryReceita.SQL.Add('SELECT CODIGO, CODIGO ||'+#39+' - '+#39+'|| RECEITA AS REC '+
    'FROM TIPO_RECEITA_SITIO ORDER BY CODIGO');
  qryReceita.Open;
  qryReceita.FetchAll;

  RDG_AGRUPADO.ItemIndex := 0;

end;

procedure TfrmListDespRec.cboDespesaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_back then
    cboDespesa.KeyValue := NULL;
end;

procedure TfrmListDespRec.cboReceitaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_back then
    cboReceita.KeyValue := NULL;
end;

procedure TfrmListDespRec.txt_data_iEnter(Sender: TObject);
begin
  txt_data_i.Color := $00F5EEDE;
end;

procedure TfrmListDespRec.txt_data_iExit(Sender: TObject);
begin
  txt_data_i.Color := clwindow;
end;

procedure TfrmListDespRec.txt_data_fEnter(Sender: TObject);
begin
  txt_data_f.Color := $00F5EEDE;
end;

procedure TfrmListDespRec.txt_data_fExit(Sender: TObject);
begin
  txt_data_f.Color := clwindow;
end;

procedure TfrmListDespRec.cboDespesaEnter(Sender: TObject);
begin
  cboDespesa.Color := $00F5EEDE;
end;

procedure TfrmListDespRec.cboDespesaExit(Sender: TObject);
begin
  cboDespesa.Color:= clwindow;
end;

procedure TfrmListDespRec.cboReceitaEnter(Sender: TObject);
begin
  cboReceita.Color := $00F5EEDE;
end;

procedure TfrmListDespRec.cboReceitaExit(Sender: TObject);
begin
  cboReceita.Color := clwindow;
end;

end.
