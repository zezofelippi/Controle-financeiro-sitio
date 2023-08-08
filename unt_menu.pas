unit unt_menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls;

type
  Tfrm_menu = class(TForm)
    MainMenu1: TMainMenu;
    menDespesas: TMenuItem;
    ipoDespesa1: TMenuItem;
    menCadDespesas: TMenuItem;
    N1: TMenuItem;
    menRelGeral: TMenuItem;
    menReceita: TMenuItem;
    menRelatorioGeral: TMenuItem;
    N3: TMenuItem;
    menReceitasXDespesas: TMenuItem;
    menObs: TMenuItem;
    menDescricaoOBS: TMenuItem;
    menCadReceita: TMenuItem;
    menCadTipoReceita: TMenuItem;
    N4: TMenuItem;
    menDiversos: TMenuItem;
    menMovimentaoMaquina: TMenuItem;
    menLeituraCPFL: TMenuItem;
    procedure DataemDiassemana1Click(Sender: TObject);
    procedure Lembrete1Click(Sender: TObject);
    procedure ipoDespesa1Click(Sender: TObject);
    procedure menCadDespesasClick(Sender: TObject);
    procedure menRelGeralClick(Sender: TObject);
    procedure Rel1Click(Sender: TObject);
    procedure RelMediaporGraficos1Click(Sender: TObject);
    procedure menReceitasXDespesasClick(Sender: TObject);
    procedure menDescricaoOBSClick(Sender: TObject);
    procedure menCadReceitaClick(Sender: TObject);
    procedure menCadTipoReceitaClick(Sender: TObject);
    procedure menMovimentaoMaquinaClick(Sender: TObject);
    procedure menLeituraCPFLClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_menu: Tfrm_menu;

implementation

uses
  untCadTipoDespesa, unt_cad_despesas, unt_rel_data_tipo,
  untCadTipoReceita, unt_cad_receitas, untListDespRec,
  untMovimentacaoMaquina;


{$R *.dfm}

procedure Tfrm_menu.DataemDiassemana1Click(Sender: TObject);
begin
//Application.CreateForm(Tfrm_data_dias_semana, frm_data_dias_semana);
//frm_data_dias_semana.show;
end;

procedure Tfrm_menu.Lembrete1Click(Sender: TObject);
begin
//Application.CreateForm(Tfrm_contas_pagar, frm_contas_pagar);
//frm_contas_pagar.show;

end;

procedure Tfrm_menu.ipoDespesa1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCadTipoDespesa, frmCadTipoDespesa);
  frmCadTipoDespesa.show;
end;

procedure Tfrm_menu.menCadDespesasClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cad_despesas, frm_cad_despesas);
  frm_cad_despesas.show;
end;

procedure Tfrm_menu.menRelGeralClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_rel_data_tipo, frm_rel_data_tipo);
  frm_rel_data_tipo.show;
end;

procedure Tfrm_menu.Rel1Click(Sender: TObject);
begin
//Application.CreateForm(TfrmRelMediaDesp, frmRelMediaDesp);
//frmRelMediaDesp.show;
end;

procedure Tfrm_menu.RelMediaporGraficos1Click(Sender: TObject);
begin
//Application.CreateForm(TfrmGraficoDespesa, frmGraficoDespesa);
//frmGraficoDespesa.show;
end;

procedure Tfrm_menu.menReceitasXDespesasClick(Sender: TObject);
begin
  Application.CreateForm(TfrmListDespRec, frmListDespRec);
  frmListDespRec.show;
end;

procedure Tfrm_menu.menDescricaoOBSClick(Sender: TObject);
begin
//Application.CreateForm(Tfrm_obs, frm_obs);
//frm_obs.show;
end;

procedure Tfrm_menu.menCadReceitaClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cad_receitas, frm_cad_receitas);
  frm_cad_receitas.show;
end;

procedure Tfrm_menu.menCadTipoReceitaClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadTipoReceita, frmCadTipoReceita);
  frmCadTipoReceita.show;
end;

procedure Tfrm_menu.menMovimentaoMaquinaClick(Sender: TObject);
begin
Application.CreateForm(TfrmMovimentacaoMaquina, frmMovimentacaoMaquina);
frmMovimentacaoMaquina.show;
end;

procedure Tfrm_menu.menLeituraCPFLClick(Sender: TObject);
begin
//Application.CreateForm(TfrmLeituraCPFL, frmLeituraCPFL);
//frmLeituraCPFL.show;
end;

end.
