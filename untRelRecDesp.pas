unit untRelRecDesp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, RLReport, RLParser, DB,
  IBCustomDataSet, IBQuery;

type
  TfrmRelRecDesp = class(TForm)
    frRelatorio: TRLReport;
    RLBand1: TRLBand;
    RLLabel5: TRLLabel;
    ds_pesquisa: TDataSource;
    qry_pesquisa: TIBQuery;
    lbl_data: TRLLabel;
    lbl_receita_despesa: TRLLabel;
    frRelatorioAno: TRLReport;
    RLBand5: TRLBand;
    RLLabel6: TRLLabel;
    lbl_data_ano: TRLLabel;
    lbl_receita_despesa_ano: TRLLabel;
    RLBand8: TRLBand;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLBand7: TRLBand;
    lblAno: TRLDBText;
    txt_receita: TRLDBText;
    txt_despesa: TRLDBText;
    txt_saldo_ano: TRLDBText;
    qry_pesquisa_ano: TIBQuery;
    ds_pesquisa_ano: TDataSource;
    RLBand6: TRLBand;
    txt_receita_glo: TRLDBResult;
    txt_despesa_glo: TRLDBResult;
    txt_saldo_ano_glo: TRLDBResult;
    qry_pesquisa_rec_desp: TIBQuery;
    qry_pesquisa_anoANO: TSmallintField;
    qry_pesquisaANO: TSmallintField;
    qry_pesquisaMES: TSmallintField;
    RLGroup1: TRLGroup;
    RLBand4: TRLBand;
    txt_receita_mes_glo: TRLDBResult;
    txt_despesa_mes_glo: TRLDBResult;
    txt_saldo_mes_glo: TRLDBResult;
    RLBand3: TRLBand;
    lblMes_ano: TRLDBText;
    txt_receita_mes: TRLDBText;
    txt_despesa_mes: TRLDBText;
    txt_saldo_mes: TRLDBText;
    RLBand2: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLBand9: TRLBand;
    RLLabel7: TRLLabel;
    RLDBText1: TRLDBText;
    RLBand10: TRLBand;
    RLLabel8: TRLLabel;
    RLLabel13: TRLLabel;
    txt_receita_mes_glo_geral: TRLDBResult;
    txt_despesa_mes_glo_geral: TRLDBResult;
    txt_saldo_mes_glo_geral: TRLDBResult;
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand7BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand6BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand10BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    rec_desp : string;
  end;

var
  frmRelRecDesp: TfrmRelRecDesp;
  receita_glo, despesa_glo, receita_glo_geral, despesa_glo_geral : real;


implementation

uses unt_modulo, untListDespRec;

{$R *.dfm}

procedure TfrmRelRecDesp.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  despesa, receita : real;
  despesa_str, receita_str : string;

begin

  if RLBand3.Color = clWhite then
    RLBand3.Color := $00F4F4F4
  else
    RLBand3.Color := clWhite;


  if qry_pesquisa.FIELDbyname('MES').AsString = '1' then
    lblMes_ano.Text := 'Janeiro/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '2' then
    lblMes_ano.Text := 'Fevereiro/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '3' then
    lblMes_ano.Text := 'Março/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '4' then
    lblMes_ano.Text := 'Abril/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '5' then
    lblMes_ano.Text := 'Maio/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '6' then
    lblMes_ano.Text := 'Junho/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '7' then
    lblMes_ano.Text := 'Julho/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '8' then
    lblMes_ano.Text := 'Agosto/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '9' then
    lblMes_ano.Text := 'Setembro/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '10' then
    lblMes_ano.Text := 'Outubro/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '11' then
    lblMes_ano.Text := 'Novembro/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '12' then
    lblMes_ano.Text := 'Dezembro/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if frmListDespRec.cboReceita.Text <> '' then
    receita_str := ' AND CODIGO = ' + IntToStr(frmListDespRec.cboReceita.KeyValue)
  else
    receita_str := '';

  if  frmListDespRec.cboDespesa.Text <> '' then
    despesa_str := ' AND TIP_CODIGO_SIT = ' + IntToStr(frmListDespRec.cboDespesa.KeyValue)
  else
    despesa_str := '';


  qry_pesquisa_rec_desp.Close;
  qry_pesquisa_rec_desp.SQL.Clear;
  qry_pesquisa_rec_desp.SQL.Add('SELECT SUM(VALOR) AS TOTAL FROM CAD_DESPESA_sitio                                   '+
                                'WHERE EXTRACT(YEAR FROM DATA)=:ANO AND EXTRACT(MONTH FROM DATA)=:MES ' + despesa_str);
  qry_pesquisa_rec_desp.ParamByName('ANO').AsString := frmRelRecDesp.qry_pesquisa.fieldbyname('ANO').AsString;
  qry_pesquisa_rec_desp.ParamByName('MES').AsString := frmRelRecDesp.qry_pesquisa.fieldbyname('MES').AsString;
  qry_pesquisa_rec_desp.Open;

  txt_despesa_mes.Text := formatfloat('###,##0.00', qry_pesquisa_rec_desp.fieldbyname('TOTAL').AsFloat);
  despesa :=  qry_pesquisa_rec_desp.fieldbyname('TOTAL').AsFloat;
  despesa_glo := despesa_glo + qry_pesquisa_rec_desp.fieldbyname('TOTAL').AsFloat;
  txt_despesa_mes_glo.Text := formatfloat('###,##0.00', despesa_glo);

  despesa_glo_geral := despesa_glo_geral + qry_pesquisa_rec_desp.fieldbyname('TOTAL').AsFloat;
  txt_despesa_mes_glo_geral.Text := formatfloat('###,##0.00', despesa_glo_geral);

  qry_pesquisa_rec_desp.Close;
  qry_pesquisa_rec_desp.SQL.Clear;
  qry_pesquisa_rec_desp.SQL.Add('SELECT SUM(VALOR) AS TOTAL FROM ITENS_RECEITAS_sitio                                '+
                                'WHERE EXTRACT(YEAR FROM DATA)=:ANO AND EXTRACT(MONTH FROM DATA)=:MES ' + receita_str);
  qry_pesquisa_rec_desp.ParamByName('ANO').AsString := frmRelRecDesp.qry_pesquisa.fieldbyname('ANO').AsString;
  qry_pesquisa_rec_desp.ParamByName('MES').AsString := frmRelRecDesp.qry_pesquisa.fieldbyname('MES').AsString;
  qry_pesquisa_rec_desp.Open;

  txt_receita_mes.Text := formatfloat('###,##0.00', qry_pesquisa_rec_desp.fieldbyname('TOTAL').AsFloat);
  receita :=  qry_pesquisa_rec_desp.fieldbyname('TOTAL').AsFloat;
  receita_glo := receita_glo + qry_pesquisa_rec_desp.fieldbyname('TOTAL').AsFloat;
  txt_receita_mes_glo.Text := formatfloat('###,##0.00', receita_glo);

  receita_glo_geral := receita_glo_geral + qry_pesquisa_rec_desp.fieldbyname('TOTAL').AsFloat;
  txt_receita_mes_glo_geral.Text := formatfloat('###,##0.00', receita_glo_geral);

  txt_saldo_mes.Text := formatfloat('###,##0.00',receita - despesa);
  txt_saldo_mes_glo.Text := formatfloat('###,##0.00',receita_glo - despesa_glo);
  txt_saldo_mes_glo_geral.Text := formatfloat('###,##0.00',receita_glo_geral - despesa_glo_geral);

  if (receita - despesa) < 0 then
    txt_saldo_mes.Font.Color := clred
  else
    txt_saldo_mes.Font.Color := clblack;

  if (receita_glo - despesa_glo) < 0 then
    txt_saldo_mes_glo.Font.Color := clred
  else
    txt_saldo_mes_glo.Font.Color := clblack;

  if (receita_glo_geral - despesa_glo_geral) < 0 then
    txt_saldo_mes_glo_geral.Font.Color := clred
  else
    txt_saldo_mes_glo_geral.Font.Color := clblack;

end;

procedure TfrmRelRecDesp.RLBand4BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  receita_glo := 0;
  despesa_glo := 0;

end;

procedure TfrmRelRecDesp.RLBand7BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  despesa, receita : real;
  despesa_str, receita_str : string;

begin

  if RLBand7.Color = clWhite then
    RLBand7.Color := $00F4F4F4
  else
    RLBand7.Color := clWhite;

  lblAno.Text := qry_pesquisa_ano.FIELDbyname('ANO').AsString;

  if frmListDespRec.cboReceita.Text <> '' then
    receita_str := ' AND CODIGO = ' + IntToStr(frmListDespRec.cboReceita.KeyValue)
  else
    receita_str := '';

  if  frmListDespRec.cboDespesa.Text <> '' then
    despesa_str := ' AND TIP_CODIGO_SIT = ' + IntToStr(frmListDespRec.cboDespesa.KeyValue)
  else
    despesa_str := '';

  qry_pesquisa_rec_desp.Close;
  qry_pesquisa_rec_desp.SQL.Clear;
  qry_pesquisa_rec_desp.SQL.Add('SELECT SUM(VALOR) AS TOTAL FROM CAD_DESPESA_sitio '+
                                'WHERE EXTRACT(YEAR FROM DATA)=:DATA '+ despesa_str);
  qry_pesquisa_rec_desp.ParamByName('DATA').AsString := frmRelRecDesp.qry_pesquisa_ano.fieldbyname('ANO').AsString;
  qry_pesquisa_rec_desp.Open;

  txt_despesa.Text := formatfloat('###,##0.00', qry_pesquisa_rec_desp.fieldbyname('TOTAL').AsFloat);
  despesa :=  qry_pesquisa_rec_desp.fieldbyname('TOTAL').AsFloat;
  despesa_glo := despesa_glo + qry_pesquisa_rec_desp.fieldbyname('TOTAL').AsFloat;
  txt_despesa_glo.Text := formatfloat('###,##0.00', despesa_glo);

  qry_pesquisa_rec_desp.Close;
  qry_pesquisa_rec_desp.SQL.Clear;
  qry_pesquisa_rec_desp.SQL.Add('SELECT SUM(VALOR) AS TOTAL FROM ITENS_RECEITAS_sitio '+
    'WHERE EXTRACT(YEAR FROM DATA)=:DATA ' + receita_str);
  qry_pesquisa_rec_desp.ParamByName('DATA').AsString := frmRelRecDesp.qry_pesquisa_ano.fieldbyname('ANO').AsString;
  qry_pesquisa_rec_desp.ParamByName('DATA').AsString := frmRelRecDesp.qry_pesquisa_ano.fieldbyname('ANO').AsString;
  qry_pesquisa_rec_desp.Open;

  txt_receita.Text := formatfloat('###,##0.00', qry_pesquisa_rec_desp.fieldbyname('TOTAL').AsFloat);
  receita :=  qry_pesquisa_rec_desp.fieldbyname('TOTAL').AsFloat;
  receita_glo := receita_glo + qry_pesquisa_rec_desp.fieldbyname('TOTAL').AsFloat;
  txt_receita_glo.Text := formatfloat('###,##0.00', receita_glo);

  txt_saldo_ano.Text := formatfloat('###,##0.00',receita - despesa);
  txt_saldo_ano_glo.Text := formatfloat('###,##0.00',receita_glo - despesa_glo);

  if (receita - despesa) < 0 then
    txt_saldo_ano.Font.Color := clred
  else
    txt_saldo_ano.Font.Color := clblack;

  if (receita_glo - despesa_glo) < 0 then
    txt_saldo_ano_glo.Font.Color := clred
  else
    txt_saldo_ano_glo.Font.Color := clblack;

end;

procedure TfrmRelRecDesp.RLBand6BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  receita_glo := 0;
  despesa_glo := 0;

end;

procedure TfrmRelRecDesp.RLBand10BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  receita_glo_geral := 0;
  despesa_glo_geral := 0;
end;

end.
