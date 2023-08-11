unit untRelObs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, DB, IBCustomDataSet, IBQuery;

type
  TfrmRelObs = class(TForm)
    frRelatorio: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLBand2: TRLBand;
    RLLabel2: TRLLabel;
    RLBand3: TRLBand;
    qryObs: TIBQuery;
    dsObs: TDataSource;
    qryObsCODIGO: TIntegerField;
    qryObsDESCRICAO: TIBStringField;
    RLDBText1: TRLDBText;
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelObs: TfrmRelObs;

implementation

uses unt_modulo;

{$R *.dfm}

procedure TfrmRelObs.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if RLBand3.Color = clWhite then
    RLBand3.Color := $00F4F4F4
  else
    RLBand3.Color := clWhite;
end;

end.
