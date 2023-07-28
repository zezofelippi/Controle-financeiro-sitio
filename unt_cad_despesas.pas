unit unt_cad_despesas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, IBDatabase, DB, IBCustomDataSet, IBQuery,
  CurrEdit, DBCtrls, ToolEdit;

type
  Tfrm_cad_despesas = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    txt_outra_despesa: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    qry_despesa: TIBQuery;
    IBTransLocal: TIBTransaction;
    txt_Valor: TCurrencyEdit;
    txt_data: TDateEdit;
    QRY_MAX_CODIGO: TIBQuery;
    cboDespesa: TDBLookupComboBox;
    qryDespesa: TIBQuery;
    dsDespesa: TDataSource;
    qry_pesquisa: TIBQuery;
    qryDespesaTIP_CODIGO_SIT: TIntegerField;
    qryDespesaTIP_DESCRICAO_SIT: TIBStringField;
    qryDespesaDESPESA: TIBStringField;
    qry_pesquisa_ano: TIBQuery;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cbo_despesaKeyPress(Sender: TObject; var Key: Char);
    procedure txt_outra_despesaKeyPress(Sender: TObject; var Key: Char);
    procedure txt_valorKeyPress(Sender: TObject; var Key: Char);
    procedure txt_dataKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbo_despesaEnter(Sender: TObject);
    procedure cbo_despesaExit(Sender: TObject);
    procedure txt_outra_despesaEnter(Sender: TObject);
    procedure txt_outra_despesaExit(Sender: TObject);
    procedure txt_ValorEnter(Sender: TObject);
    procedure txt_ValorExit(Sender: TObject);
    procedure txt_dataEnter(Sender: TObject);
    procedure txt_dataExit(Sender: TObject);
    procedure cboDespesaEnter(Sender: TObject);
    procedure cboDespesaExit(Sender: TObject);
    procedure cboDespesaKeyPress(Sender: TObject; var Key: Char);
    procedure cboDespesaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cad_despesas: Tfrm_cad_despesas;

implementation

uses unt_modulo;

{$R *.dfm}

procedure Tfrm_cad_despesas.FormShow(Sender: TObject);
begin

txt_outra_despesa.Clear;
txt_valor.Clear;
txt_data.Clear;

qryDespesa.Close;
qryDespesa.SQL.Clear;
qryDespesa.SQL.Add('SELECT TIP_CODIGO_SIT, TIP_DESCRICAO_SIT, TIP_CODIGO_SIT ||'+#39+' - '+#39+'|| TIP_DESCRICAO_SIT AS DESPESA FROM TIPO_DESPESA_SITIO');
qryDespesa.Open;
qryDespesa.FetchAll;

cboDespesa.SetFocus;

end;

procedure Tfrm_cad_despesas.Button1Click(Sender: TObject);
var
cod_despesa : integer;
mes, ano, codmes, codano : string;

begin

if cboDespesa.Text = '' then
begin
showmessage('Coloque a despesa');
cboDespesa.SetFocus;
exit;
end;


if txt_valor.Text = '' then
begin
showmessage('Coloque o valor');
txt_valor.SetFocus;
exit;
end;

if txt_data.Text = '  /  /    ' then
begin
showmessage('Coloque a data');
txt_data.SetFocus;
exit;
end;

QRY_MAX_CODIGO.Close;
QRY_MAX_CODIGO.SQL.Clear;
QRY_MAX_CODIGO.SQL.Add('SELECT MAX(CODIGO) AS CODIGO FROM CAD_DESPESA_SITIO');
QRY_MAX_CODIGO.Open;
cod_despesa := QRY_MAX_CODIGO.FieldByName('CODIGO').AsInteger +1;


//VERIFICA SE COD_MES ESTA PREENCHIDO NO CAD. RECEITA E CAD. DESPESA//////////

   mes := (formatdatetime('mm',strtodatetime(txt_data.text)));
   ano := (formatdatetime('yyyy',strtodatetime(txt_data.text)));
   
   qry_pesquisa.Close;
   qry_pesquisa.SQL.Clear;
   qry_pesquisa.SQL.Add('SELECT EXTRACT(month FROM DATA) AS MES, EXTRACT(YEAR FROM DATA) AS ANO, COD_MES  '+
     'FROM ITENS_RECEITAS_SITIO WHERE EXTRACT(month FROM DATA) =:MES                    '+
     'AND EXTRACT(YEAR FROM DATA) =:ANO');
   qry_pesquisa.ParamByName('MES').AsString := mes;
   qry_pesquisa.ParamByName('ANO').AsString := ano;
   qry_pesquisa.Open;

   if not qry_pesquisa.IsEmpty then
    codmes:= qry_pesquisa.fieldbyname('COD_MES').AsString
   else
    codmes:= '';

   if codmes <> '' then
   begin
     qry_pesquisa.Close;
     qry_pesquisa.SQL.Clear;
     qry_pesquisa.SQL.Add('SELECT EXTRACT(month FROM DATA) AS MES, EXTRACT(YEAR FROM DATA) AS ANO, COD_MES  '+
       'FROM CAD_DESPESA_SITIO WHERE COD_MES=:COD_MES');
     qry_pesquisa.ParamByName('COD_MES').AsString := codmes;
     qry_pesquisa.Open;
   end;
    

/////FIM VERIFICA SE COD_MES ESTA PREENCHIDO NO CAD. RECEITA E CAD. DESPESA/////////////


//VERIFICA SE COD_ANO ESTA PREENCHIDO NO CAD. RECEITA E CAD. DESPESA//////////

   ano := (formatdatetime('yyyy',strtodatetime(txt_data.text)));
   
   qry_pesquisa_ano.Close;
   qry_pesquisa_ano.SQL.Clear;
   qry_pesquisa_ano.SQL.Add('SELECT EXTRACT(YEAR FROM DATA) AS ANO, COD_ANO  '+
     'FROM ITENS_RECEITAS_SITIO WHERE                     '+
     'EXTRACT(YEAR FROM DATA) =:ANO');
   qry_pesquisa_ano.ParamByName('ANO').AsString := ano;
   qry_pesquisa_ano.Open;

   if not qry_pesquisa_ano.IsEmpty then
    codano:= qry_pesquisa_ano.fieldbyname('COD_ANO').AsString
   else
    codano:= '';

   if codano <> '' then
   begin
     qry_pesquisa_ano.Close;
     qry_pesquisa_ano.SQL.Clear;
     qry_pesquisa_ano.SQL.Add('SELECT EXTRACT(YEAR FROM DATA) AS ANO, COD_ANO  '+
       'FROM CAD_DESPESA_SITIO WHERE COD_ANO=:COD_ANO');
     qry_pesquisa_ano.ParamByName('COD_ANO').AsString := codano;
     qry_pesquisa_ano.Open;
   end;
    

/////FIM VERIFICA SE COD_ANO ESTA PREENCHIDO NO CAD. RECEITA E CAD. DESPESA/////////////


 if not IBTRANSLOCAL.InTransaction then
    IBTRANSLOCAL.StartTransaction;
  qry_despesa.Close;
  qry_despesa.SQL.Clear;
  qry_despesa.SQL.Add('INSERT INTO CAD_DESPESA_SITIO (CODIGO, DESPESA_OUTROS, VALOR, DATA, TIP_CODIGO_SIT, COD_MES, COD_ANO)  '+
                      'VALUES (:CODIGO, :DESPESA_OUTROS, :VALOR, :DATA, :TIP_CODIGO_SIT, :COD_MES, :COD_ANO)');
  qry_despesa.ParamByName('CODIGO').AsInteger         := cod_despesa;
  qry_despesa.ParamByName('DESPESA_OUTROS').AsString  := txt_outra_despesa.Text;
  qry_despesa.ParamByName('VALOR').AsFLOAT            := txt_valor.Value;
  qry_despesa.ParamByName('DATA').AsDateTime          := txt_data.Date;
  qry_despesa.ParamByName('TIP_CODIGO_SIT').AsInteger     := cboDespesa.KeyValue;

  if (qry_pesquisa.IsEmpty) and (codmes <> '') then  //SO PODE GRAVAR O COD_MES EM UM REGISTRO NO MES
     qry_despesa.ParamByName('COD_MES').AsString  := codmes;

  if (qry_pesquisa_ano.IsEmpty) and (codano <> '') then  //SO PODE GRAVAR O COD_ANO EM UM REGISTRO NO ANO
     qry_despesa.ParamByName('COD_ANO').AsString  := codano;

  qry_despesa.ExecSQL;
  IBTRANSLOCAL.Commit;



cboDespesa.KeyValue := NULL;
txt_outra_despesa.Clear;
txt_valor.Clear;
txt_data.Clear;

cboDespesa.SetFocus;

end;

procedure Tfrm_cad_despesas.cbo_despesaKeyPress(Sender: TObject;
  var Key: Char);
begin
if key =#13 then
   txt_outra_despesa.SetFocus; 
end;

procedure Tfrm_cad_despesas.txt_outra_despesaKeyPress(Sender: TObject;
  var Key: Char);
begin
if key =#13 then
txt_valor.SetFocus;
end;

procedure Tfrm_cad_despesas.txt_valorKeyPress(Sender: TObject;
  var Key: Char);
begin
if key =#13 then
txt_data.SetFocus;
end;

procedure Tfrm_cad_despesas.txt_dataKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key=#13 then
    button1.SetFocus;
end;

procedure Tfrm_cad_despesas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
frm_cad_despesas := nil;
action:= cafree;
end;

procedure Tfrm_cad_despesas.cbo_despesaEnter(Sender: TObject);
begin
cboDespesa.Color := $00F5EEDE;
end;

procedure Tfrm_cad_despesas.cbo_despesaExit(Sender: TObject);
begin
cboDespesa.Color := clwindow;
end;

procedure Tfrm_cad_despesas.txt_outra_despesaEnter(Sender: TObject);
begin
txt_outra_despesa.Color := $00F5EEDE;
end;

procedure Tfrm_cad_despesas.txt_outra_despesaExit(Sender: TObject);
begin
txt_outra_despesa.Color := clwindow;
end;

procedure Tfrm_cad_despesas.txt_ValorEnter(Sender: TObject);
begin
txt_valor.Color := $00F5EEDE;
end;

procedure Tfrm_cad_despesas.txt_ValorExit(Sender: TObject);
begin
txt_valor.Color := clwindow;
end;

procedure Tfrm_cad_despesas.txt_dataEnter(Sender: TObject);
begin
txt_data.Color := $00F5EEDE;
end;

procedure Tfrm_cad_despesas.txt_dataExit(Sender: TObject);
begin
txt_data.Color := clwindow;
end;

procedure Tfrm_cad_despesas.cboDespesaEnter(Sender: TObject);
begin
cboDespesa.Color :=$00F5EEDE;
end;

procedure Tfrm_cad_despesas.cboDespesaExit(Sender: TObject);
begin
cboDespesa.Color := clwindow;
end;

procedure Tfrm_cad_despesas.cboDespesaKeyPress(Sender: TObject;
  var Key: Char);
begin
if key =#13 then
   txt_outra_despesa.SetFocus;
end;

procedure Tfrm_cad_despesas.cboDespesaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = Vk_back then
  cboDespesa.KeyValue := null;

  
end;

end.
