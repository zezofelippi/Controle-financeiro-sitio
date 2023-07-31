unit untRelCadDespesa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, DB, IBCustomDataSet, IBQuery;

type
  TfrmRelCadDespesa = class(TForm)
    frRelatorio: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLBand6: TRLBand;
    RLLabel4: TRLLabel;
    RLDBResult2: TRLDBResult;
    qry_pesquisa: TIBQuery;
    ds_pesquisar: TDataSource;
    qry_pesquisaMES: TSmallintField;
    qry_pesquisaDESCR: TIBStringField;
    qry_pesquisaDATA: TDateTimeField;
    qry_pesquisaVALOR: TIBBCDField;
    qry_pesquisaSEMANA: TIBStringField;
    qry_pesquisaDESPESA_OUTROS: TIBStringField;
    qry_pesquisaCODIGO: TIntegerField;
    lbl_data: TRLLabel;
    frRelatorioAno: TRLReport;
    RLBand7: TRLBand;
    RLGroup2: TRLGroup;
    RLBand11: TRLBand;
    RLBand10: TRLBand;
    RLBand9: TRLBand;
    RLBand8: TRLBand;
    RLBand12: TRLBand;
    RLLabel10: TRLLabel;
    lbl_data_ano: TRLLabel;
    lbl_ano: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLDBText6: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLLabel9: TRLLabel;
    RLDBResult3: TRLDBResult;
    RLLabel11: TRLLabel;
    RLDBResult4: TRLDBResult;
    qryPesquisaAno: TIBQuery;
    dsPesquisaAno: TDataSource;
    qryPesquisaAnoANO: TSmallintField;
    qryPesquisaAnoDESCR: TIBStringField;
    qryPesquisaAnoCODIGO: TIntegerField;
    qryPesquisaAnoDATA: TDateTimeField;
    qryPesquisaAnoVALOR: TIBBCDField;
    qryPesquisaAnoSEMANA: TIBStringField;
    qryPesquisaAnoDESPESA_OUTROS: TIBStringField;
    RLLabel12: TRLLabel;
    qry_pesquisaANO: TSmallintField;
    RLGroup1: TRLGroup;
    RLGroup4: TRLGroup;
    RLBand5: TRLBand;
    RLLabel2: TRLLabel;
    RLDBResult1: TRLDBResult;
    RLBand4: TRLBand;
    RLLabel5: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel8: TRLLabel;
    RLBand3: TRLBand;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText5: TRLDBText;
    RLBand2: TRLBand;
    lblMes_ano: TRLLabel;
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand10BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand8BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCadDespesa: TfrmRelCadDespesa;

implementation

uses unt_modulo;

{$R *.dfm}

procedure TfrmRelCadDespesa.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if qry_pesquisa.FIELDbyname('MES').AsString = '1' then
    lblMes_ano.Caption := 'Janeiro/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '2' then
    lblMes_ano.Caption := 'Fevereiro/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '3' then
    lblMes_ano.Caption := 'Março/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '4' then
    lblMes_ano.Caption := 'Abril/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '5' then
    lblMes_ano.Caption := 'Maio/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '6' then
    lblMes_ano.Caption := 'Junho/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '7' then
    lblMes_ano.Caption := 'Julho/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '8' then
    lblMes_ano.Caption := 'Agosto/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '9' then
    lblMes_ano.Caption := 'Setembro/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '10' then
    lblMes_ano.Caption := 'Outubro/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '11' then
    lblMes_ano.Caption := 'Novembro/' + qry_pesquisa.FIELDbyname('ANO').AsString;

  if qry_pesquisa.FIELDbyname('MES').AsString = '12' then
    lblMes_ano.Caption := 'Dezembro/' + qry_pesquisa.FIELDbyname('ANO').AsString;
end;

procedure TfrmRelCadDespesa.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if RLBand3.Color = clWhite then
    RLBand3.Color := $00F4F4F4
  else
    RLBand3.Color := clWhite;
end;

procedure TfrmRelCadDespesa.RLBand10BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if RLBand10.Color = clWhite then
    RLBand10.Color := $00F4F4F4
  else
    RLBand10.Color := clWhite;
end;

procedure TfrmRelCadDespesa.RLBand8BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  lbl_ano.Caption := qryPesquisaAno.fieldbyname('ANO').AsString;
end;

end.
