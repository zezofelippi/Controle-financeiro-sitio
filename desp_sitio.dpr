program desp_sitio;

uses
  Forms,
 unt_menu in 'unt_menu.pas' {frm_menu},
 unt_modulo in 'unt_modulo.pas' {dm: TDataModule},
  untRelCadDespesa in 'untRelCadDespesa.pas' {frmRelCadDespesa},
  untRelCadReceita in 'untRelCadReceita.pas' {frmRelCadReceita},
  unt_cad_despesas in 'unt_cad_despesas.pas' {frm_cad_despesas},
  untCadTipoDespesa in 'untCadTipoDespesa.pas' {frmCadTipoDespesa},
  unt_rel_data_tipo in 'unt_rel_data_tipo.pas' {frm_rel_data_tipo},
  unt_cad_receitas in 'unt_cad_receitas.pas' {frm_cad_receitas},
  untListDespRec in 'untListDespRec.pas' {frmListDespRec},
  untRelRecDesp in 'untRelRecDesp.pas' {frmRelRecDesp},     
  untCadTipoReceita in 'untCadTipoReceita.pas' {frmCadTipoReceita},
  unt_obs in 'unt_obs.pas' {frm_obs},
  untRelObs in 'untRelObs.pas' {frmRelObs},
  untMovimentacaoMaquina in 'untMovimentacaoMaquina.pas' {frmMovimentacaoMaquina},
  untLeituraCPFL in 'untLeituraCPFL.pas' {frmLeituraCPFL};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfrm_menu, frm_menu);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmRelCadDespesa, frmRelCadDespesa);
  Application.CreateForm(TfrmRelCadReceita, frmRelCadReceita);
  Application.CreateForm(Tfrm_cad_despesas, frm_cad_despesas);
  Application.CreateForm(TfrmCadTipoDespesa, frmCadTipoDespesa);
  Application.CreateForm(Tfrm_rel_data_tipo, frm_rel_data_tipo);
  Application.CreateForm(Tfrm_cad_receitas, frm_cad_receitas);
  Application.CreateForm(TfrmListDespRec, frmListDespRec);
  Application.CreateForm(TfrmRelRecDesp, frmRelRecDesp);
  Application.CreateForm(TfrmCadTipoReceita, frmCadTipoReceita);
  Application.CreateForm(Tfrm_obs, frm_obs);
  Application.CreateForm(TfrmRelObs, frmRelObs);
  Application.CreateForm(TfrmMovimentacaoMaquina, frmMovimentacaoMaquina);
  Application.CreateForm(TfrmLeituraCPFL, frmLeituraCPFL);
  Application.Run;
end.
