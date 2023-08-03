unit untRelCadReceita;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, DB, IBCustomDataSet, IBQuery;

type
  TfrmRelCadReceita = class(TForm)
    frRelatorio: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLBand5: TRLBand;
    RLBand4: TRLBand;
    RLLabel5: TRLLabel;
    qry_pesquisa: TIBQuery;
    ds_pesquisa: TDataSource;
    RLBand6: TRLBand;
    RLLabel2: TRLLabel;
    RLDBResult1: TRLDBResult;
    RLLabel4: TRLLabel;
    RLDBResult2: TRLDBResult;
    RLLabel9: TRLLabel;
    lbl_safra: TRLLabel;
    qry_pesquisaCOD_ITEM: TIntegerField;
    qry_pesquisaDESCRICAO_ITEM: TIBStringField;
    qry_pesquisaDATA: TDateTimeField;
    qry_pesquisaVALOR: TIBBCDField;
    qry_pesquisaREC_CODIGO: TIntegerField;
    RLLabel6: TRLLabel;
    RLDBText2: TRLDBText;
    qryPesqSafra: TIBQuery;
    RLLabel3: TRLLabel;
    RLLabel7: TRLLabel;
    lbl_obs: TRLLabel;
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCadReceita: TfrmRelCadReceita;

implementation

uses unt_modulo;

{$R *.dfm}

procedure TfrmRelCadReceita.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
qryPesqSafra.Close;
qryPesqSafra.SQL.Clear;
qryPesqSafra.SQL.Add('SELECT * FROM CAD_RECEITAS_SITIO WHERE REC_CODIGO=:REC_CODIGO');
qryPesqSafra.ParamByName('REC_CODIGO').AsString := qry_pesquisa.fieldbyname('REC_CODIGO').AsString;
qryPesqSafra.Open;

LBL_SAFRA.Caption := qryPesqSafra.fieldbyname('SAFRA_ANO').AsString;
LBL_obs.Caption := qryPesqSafra.fieldbyname('OBS').AsString;

end;

procedure TfrmRelCadReceita.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
 if RLBand3.Color = clWhite then
  RLBand3.Color := $00F4F4F4
 else
  RLBand3.Color := clWhite;
end;


end.
