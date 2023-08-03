unit unt_cad_receitas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, IBDatabase, DB, IBCustomDataSet, IBQuery,
  ToolEdit, CurrEdit, DBCtrls, Grids, DBGrids, ExtCtrls;

type
  Tfrm_cad_receitas = class(TForm)
    qry_receita: TIBQuery;
    IBTransLocal: TIBTransaction;
    QRY_MAX_CODIGO: TIBQuery;
    qry_tipo_receita: TIBQuery;
    ds_receita: TDataSource;
    qry_tipo_receitaCODIGO: TIntegerField;
    qry_tipo_receitaREC: TIBStringField;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    btnPesquisar: TButton;
    qryPesquisa: TIBQuery;
    dsPesquisa: TDataSource;
    qryTotal: TIBQuery;
    btnRelatorio: TButton;
    qry_pesquisa: TIBQuery;
    Label11: TLabel;
    txt_obs: TEdit;
    Label8: TLabel;
    txt_safra: TEdit;
    Label9: TLabel;
    txt_codigo: TEdit;
    btnIncluir: TButton;
    btnFinalizar: TButton;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    txt_Valor: TCurrencyEdit;
    txt_data: TDateEdit;
    txt_desc_receita: TDBLookupComboBox;
    btnGravar: TButton;
    DBGrid2: TDBGrid;
    Label6: TLabel;
    txt_total: TCurrencyEdit;
    txt_safra_pesq: TEdit;
    Label10: TLabel;
    Label12: TLabel;
    TXT_TOTAL_SAFRA: TCurrencyEdit;
    qry_item: TIBQuery;
    ds_item: TDataSource;
    qry_itemCOD_ITEM: TIntegerField;
    qry_itemDESCRICAO_ITEM: TIBStringField;
    qry_itemDATA: TDateTimeField;
    qry_itemVALOR: TIBBCDField;
    btnAlterar: TButton;
    qryPesquisaREC_CODIGO: TIntegerField;
    qryPesquisaOBS: TIBStringField;
    qryPesquisaSAFRA_ANO: TIBStringField;
    qryPesquisaVALOR_TOTAL: TIBBCDField;
    btnCancelar: TButton;
    qry_pesquisa_ano: TIBQuery;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure txt_desc_receitaKeyPress(Sender: TObject; var Key: Char);
    procedure txt_valorKeyPress(Sender: TObject; var Key: Char);
    procedure txt_dataKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure txt_desc_receitaEnter(Sender: TObject);
    procedure txt_desc_receitaExit(Sender: TObject);
    procedure txt_ValorEnter(Sender: TObject);
    procedure txt_ValorExit(Sender: TObject);
    procedure txt_dataEnter(Sender: TObject);
    procedure txt_dataExit(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnRelatorioClick(Sender: TObject);
    procedure txt_obsEnter(Sender: TObject);
    procedure txt_obsExit(Sender: TObject);
    procedure txt_obsKeyPress(Sender: TObject; var Key: Char);
    procedure btnIncluirClick(Sender: TObject);
    procedure txt_safraEnter(Sender: TObject);
    procedure txt_safraExit(Sender: TObject);
    procedure txt_safraKeyPress(Sender: TObject; var Key: Char);
    procedure btnFinalizarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCancelarClick(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cad_receitas: Tfrm_cad_receitas;

implementation

uses unt_modulo, untRelCadReceita;

{$R *.dfm}

procedure Tfrm_cad_receitas.FormShow(Sender: TObject);
begin

  qry_tipo_receita.Close;
  qry_tipo_receita.SQL.Clear;
  qry_tipo_receita.SQL.Add('SELECT CODIGO, CODIGO ||'+#39+' - '+#39+'|| RECEITA AS REC '+
    'FROM TIPO_RECEITA_SITIO ORDER BY CODIGO');
  qry_tipo_receita.Open;
  qry_tipo_receita.FetchAll;

  txt_desc_receita.SetFocus;

  btnIncluir.Enabled := true;
  btnAlterar.Enabled := false;
  btnCancelar.Enabled := false;
  btnFinalizar.Enabled := false;
  btnGravar.Enabled := false;

end;

procedure Tfrm_cad_receitas.btnGravarClick(Sender: TObject);
var
  cod_item, codmes, codano : integer;
  mes, ano :string;

begin

  if (txt_codigo.Text = '') then
  begin
    showmessage('Nenhuma safra selecionada ou inserida');
    txt_codigo.SetFocus;
    exit;
  end;

  if (txt_safra.Text = '') then
  begin
    showmessage('Digite uma safra');
    txt_safra.SetFocus;
    exit;
  end;

  if (txt_desc_receita.Text = '') then
  begin
    showmessage('Coloque a descricao da receita');
    txt_desc_receita.SetFocus;
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
  QRY_MAX_CODIGO.SQL.Add('SELECT MAX(COD_ITEM) AS CODIGO FROM ITENS_RECEITAS_SITIO');
  QRY_MAX_CODIGO.Open;
  cod_item := QRY_MAX_CODIGO.FieldByName('CODIGO').AsInteger +1;


////VERIFICA SE COD_MES JA FOI CADASTRADO////

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

  if qry_pesquisa.IsEmpty then
  begin
    QRY_MAX_CODIGO.Close;
    QRY_MAX_CODIGO.SQL.Clear;
    QRY_MAX_CODIGO.SQL.Add('SELECT MAX(COD_MES) AS COD_MES FROM ITENS_RECEITAS_SITIO');
    QRY_MAX_CODIGO.Open;
    codmes := QRY_MAX_CODIGO.FieldByName('COD_MES').AsInteger +1;
  end
  else
  begin
    codmes := qry_pesquisa.fieldbyname('COD_MES').AsInteger;
  end;

///////FIM VERIFICA SE COD_MES JA FOI CADASTRADO////////


////VERIFICA SE COD_ANO JA FOI CADASTRADO////

  ano := (formatdatetime('yyyy',strtodatetime(txt_data.text)));

  qry_pesquisa_ano.Close;
  qry_pesquisa_ano.SQL.Clear;
  qry_pesquisa_ano.SQL.Add('SELECT EXTRACT(YEAR FROM DATA) AS ANO, COD_ANO  '+
                           'FROM ITENS_RECEITAS_SITIO WHERE                 '+
                           'EXTRACT(YEAR FROM DATA) =:ANO                   ');
  qry_pesquisa_ano.ParamByName('ANO').AsString := ano;
  qry_pesquisa_ano.Open;

  if qry_pesquisa_ano.IsEmpty then
  begin
    QRY_MAX_CODIGO.Close;
    QRY_MAX_CODIGO.SQL.Clear;
    QRY_MAX_CODIGO.SQL.Add('SELECT MAX(COD_ANO) AS COD_ANO FROM ITENS_RECEITAS_SITIO');
    QRY_MAX_CODIGO.Open;
    codano := QRY_MAX_CODIGO.FieldByName('COD_ANO').AsInteger +1;
  end
  else
  begin
    codano := qry_pesquisa_ano.fieldbyname('COD_ANO').AsInteger;
  end;

///////FIM VERIFICA SE COD_ANO JA FOI CADASTRADO////////

  if not IBTRANSLOCAL.InTransaction then
    IBTRANSLOCAL.StartTransaction;

  qry_receita.Close;
  qry_receita.SQL.Clear;
  qry_receita.SQL.Add('INSERT INTO ITENS_RECEITAS_SITIO (COD_ITEM, REC_CODIGO, CODIGO, VALOR, DATA, COD_MES, COD_ANO)   '+
                      'VALUES (:COD_ITEM, :REC_CODIGO, :CODIGO, :VALOR, :DATA, :COD_MES, :COD_ANO)'                     );
  qry_receita.ParamByName('COD_ITEM').AsInteger       := cod_item;
  qry_receita.ParamByName('REC_CODIGO').AsString      := txt_codigo.Text;
  qry_receita.ParamByName('CODIGO').AsInteger         := txt_desc_receita.KeyValue;
  qry_receita.ParamByName('VALOR').AsFLOAT            := txt_valor.Value;
  qry_receita.ParamByName('DATA').AsDateTime          := txt_data.Date;
  qry_receita.ParamByName('COD_MES').AsInteger        := codmes;
  qry_receita.ParamByName('COD_ANO').AsInteger        := codano;

  qry_receita.ExecSQL;
  IBTRANSLOCAL.Commit;

////VERIFICA SE O COD_MES JA FOI CADASTRADO NO CAD. DESPESAS

  qry_pesquisa.Close;
  qry_pesquisa.SQL.Clear;
  qry_pesquisa.SQL.Add('SELECT COD_MES FROM CAD_DESPESA_SITIO WHERE COD_MES=:COD_MES');
  qry_pesquisa.ParamByName('COD_MES').AsString := inttostr(codmes);
  qry_pesquisa.Open;

  if qry_pesquisa.IsEmpty then
  begin

    qry_pesquisa.Close;
    qry_pesquisa.SQL.Clear;
    qry_pesquisa.SQL.Add('SELECT EXTRACT(month FROM DATA) AS MES, EXTRACT(YEAR FROM DATA) AS ANO, COD_MES, CODIGO  '+
                         'FROM CAD_DESPESA_SITIO WHERE EXTRACT(month FROM DATA) =:MES                              '+
                         'AND EXTRACT(YEAR FROM DATA) =:ANO                                                        ');
    qry_pesquisa.ParamByName('MES').AsString := mes;
    qry_pesquisa.ParamByName('ANO').AsString := ano;
    qry_pesquisa.Open;
    qry_pesquisa.First;

    if not IBTRANSLOCAL.InTransaction then
      IBTRANSLOCAL.StartTransaction;
    qry_receita.Close;
    qry_receita.SQL.Clear;
    qry_receita.SQL.Add('UPDATE CAD_DESPESA_SITIO SET COD_MES=:COD_MES WHERE CODIGO=:CODIGO');
    qry_receita.ParamByName('CODIGO').AsString          := qry_pesquisa.fieldbyname('CODIGO').AsString;
    qry_receita.ParamByName('COD_MES').AsString         := inttostr(codmes);
    qry_receita.ExecSQL;
    IBTRANSLOCAL.Commit;

  end;

/////FIM VERIFICA SE O COD_MES JA FOI CADASTRADO NO CAD. DESPESAS


////VERIFICA SE O COD_ANO JA FOI CADASTRADO NO CAD. DESPESAS

  qry_pesquisa_ano.Close;
  qry_pesquisa_ano.SQL.Clear;
  qry_pesquisa_ano.SQL.Add('SELECT COD_MES FROM CAD_DESPESA_SITIO WHERE COD_ANO=:COD_ANO');
  qry_pesquisa_ano.ParamByName('COD_ANO').AsString := inttostr(codano);
  qry_pesquisa_ano.Open;

  if qry_pesquisa_ano.IsEmpty then
  begin

    qry_pesquisa_ano.Close;
    qry_pesquisa_ano.SQL.Clear;
    qry_pesquisa_ano.SQL.Add('SELECT EXTRACT(YEAR FROM DATA) AS ANO, COD_ANO, CODIGO  '+
                             'FROM CAD_DESPESA_SITIO WHERE                            '+
                             'EXTRACT(YEAR FROM DATA) =:ANO'                          );
    qry_pesquisa_ano.ParamByName('ANO').AsString := ano;
    qry_pesquisa_ano.Open;
    qry_pesquisa_ano.First;

    if not IBTRANSLOCAL.InTransaction then
      IBTRANSLOCAL.StartTransaction;
    qry_receita.Close;
    qry_receita.SQL.Clear;
    qry_receita.SQL.Add('UPDATE CAD_DESPESA_SITIO SET COD_ANO=:COD_ANO WHERE CODIGO=:CODIGO');
    qry_receita.ParamByName('CODIGO').AsString     := qry_pesquisa_ano.fieldbyname('CODIGO').AsString;
    qry_receita.ParamByName('COD_ANO').AsString    := inttostr(codano);
    qry_receita.ExecSQL;
    IBTRANSLOCAL.Commit;

  end;

/////FIM VERIFICA SE O COD_ANO JA FOI CADASTRADO NO CAD. DESPESAS


///////MOSTRA OS DADOS NA GRID e SOMA O TOTAL///////////

  QRY_ITEM.Close;
  qry_item.SQL.Clear;
  qry_item.SQL.Add('SELECT  I.cod_item, T.codigo ||'+#39+' - '+#39+'|| T.receita AS DESCRICAO_ITEM,   '+
                   'I.data, I.valor                                                                   '+
                   'FROM ITENS_RECEITAS_SITIO I, TIPO_RECEITA_SITIO T                                 '+
                   'WHERE I.CODIGO = T.CODIGO AND I.REC_CODIGO =:REC_CODIGO                           ');
  qry_item.ParamByName('REC_CODIGO').AsString := txt_codigo.Text;
  qry_item.Open;

  qryTotal.Close;
  qryTotal.SQL.Clear;
  qryTotal.SQL.Add('SELECT SUM(VALOR) AS TOTAL FROM ITENS_RECEITAS_SITIO WHERE REC_CODIGO=:REC_CODIGO');
  qryTotal.ParamByName('REC_CODIGO').AsString := txt_codigo.Text;
  qryTotal.Open;

  txt_total.Value := qryTotal.fieldbyname('TOTAL').AsFloat;

//////FIM MOSTRA OS DADOS NA GRID E SOMA O TOTAL/////////////

  txt_desc_receita.KeyValue := null;
  txt_valor.Clear;
  txt_data.Clear;

  btnCancelar.Enabled := false;
  btnGravar.Enabled := false;

  txt_desc_receita.SetFocus;

end;

procedure Tfrm_cad_receitas.txt_desc_receitaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_data.SetFocus;
end;

procedure Tfrm_cad_receitas.txt_valorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    btnGravar.SetFocus;
end;

procedure Tfrm_cad_receitas.txt_dataKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then
    txt_valor.SetFocus;
end;

procedure Tfrm_cad_receitas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if txt_codigo.Text <> '' then
  begin
    if qry_item.IsEmpty = true then
    begin
      if not IBTRANSLOCAL.InTransaction then
        IBTRANSLOCAL.StartTransaction;
      qry_receita.Close;
      qry_receita.SQL.Clear;
      qry_receita.SQL.Add('DELETE FROM CAD_RECEITAS_SITIO WHERE REC_CODIGO = '+ txt_codigo.Text);
      qry_receita.ExecSQL;
      IBTRANSLOCAL.Commit;
    end;
  end;

  frm_cad_receitas := nil;
  action:= cafree;
end;

procedure Tfrm_cad_receitas.txt_desc_receitaEnter(Sender: TObject);
begin
  txt_desc_receita.Color := $00F5EEDE;
end;

procedure Tfrm_cad_receitas.txt_desc_receitaExit(Sender: TObject);
begin
  txt_desc_receita.Color := clwindow;
end;

procedure Tfrm_cad_receitas.txt_ValorEnter(Sender: TObject);
begin
  txt_valor.Color := $00F5EEDE;
end;

procedure Tfrm_cad_receitas.txt_ValorExit(Sender: TObject);
begin
  txt_valor.Color := clwindow;
end;

procedure Tfrm_cad_receitas.txt_dataEnter(Sender: TObject);
begin
  txt_data.Color := $00F5EEDE;
end;

procedure Tfrm_cad_receitas.txt_dataExit(Sender: TObject);
begin
  txt_data.Color := clwindow;
end;

procedure Tfrm_cad_receitas.btnPesquisarClick(Sender: TObject);
var
  safra, mensagem : string;
begin
  if txt_safra_pesq.Text <> '' then
    safra := ' AND SAFRA_ANO = ' + txt_safra_pesq.Text
  else
    safra := '';

  qryPesquisa.close;
  qryPesquisa.SQL.Clear;
  qryPesquisa.SQL.Add('SELECT * from CAD_RECEITAS_SITIO WHERE REC_CODIGO = REC_CODIGO ' + safra + ' ORDER BY SAFRA_ANO');
  qryPesquisa.Open;
  qryPesquisa.FetchAll;

  qryTotal.Close;
  qryTotal.SQL.Clear;
  qryTotal.SQL.Add('SELECT SUM(VALOR_TOTAL) AS TOTAL FROM CAD_RECEITAS_SITIO '+
      ' WHERE REC_CODIGO = REC_CODIGO ' + safra  );
  qryTotal.Open;

  txt_total_safra.Value := qryTotal.fieldbyname('TOTAL').AsFloat;

end;

procedure Tfrm_cad_receitas.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure Tfrm_cad_receitas.btnRelatorioClick(Sender: TObject);
var
  safra, mensagem : string;
begin

  if txt_safra_pesq.Text <> '' then
    safra := ' AND CR.SAFRA_ANO = ' + txt_safra_pesq.Text
  else
    safra := '';

  frmRelCadReceita.qry_pesquisa.Close;
  frmRelCadReceita.qry_pesquisa.SQL.Clear;
  frmRelCadReceita.qry_pesquisa.SQL.Add('SELECT  I.cod_item, T.codigo ||'+#39+' - '+#39+'|| T.receita AS DESCRICAO_ITEM,                    '+
                                        'I.data, I.valor, I.REC_CODIGO                                                                      '+
                                        'FROM ITENS_RECEITAS_SITIO I, TIPO_RECEITA_SITIO T, CAD_RECEITAS_SITIO CR                           '+
                                        'WHERE I.CODIGO = T.CODIGO AND I.REC_CODIGO = CR.REC_CODIGO  ' + safra + ' ORDER BY CR.SAFRA_ANO    ');
  frmRelCadReceita.qry_pesquisa.Open;

  if frmRelCadReceita.qry_pesquisa.isempty then
  begin
    mensagem := 'Registro nao encontrado !';
    Application.MessageBox(Pchar(mensagem), 'Informação', MB_OK+MB_ICONWARNING);
    exit;
  end;

  frmRelCadReceita.frRelatorio.Prepare;
  frmRelCadReceita.frRelatorio.PreviewModal;

end;

procedure Tfrm_cad_receitas.txt_obsEnter(Sender: TObject);
begin
  txt_obs.Color := $00F5EEDE;
end;

procedure Tfrm_cad_receitas.txt_obsExit(Sender: TObject);
begin
  txt_obs.Color := clwindow;

  if txt_obs.Text <> '' then
  begin
    if not IBTRANSLOCAL.InTransaction then
    IBTRANSLOCAL.StartTransaction;

    qry_receita.Close;
    qry_receita.SQL.Clear;
    qry_receita.SQL.Add('UPDATE CAD_RECEITAS_SITIO SET OBS=:OBS WHERE REC_CODIGO=:REC_CODIGO ');
    qry_receita.ParamByName('REC_CODIGO').AsString := txt_codigo.Text;
    qry_receita.ParamByName('OBS').AsString := txt_obs.Text;
    qry_receita.ExecSQL;

    IBTRANSLOCAL.Commit;
  end;

end;

procedure Tfrm_cad_receitas.txt_obsKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_safra.SetFocus;
end;

procedure Tfrm_cad_receitas.btnIncluirClick(Sender: TObject);
var
  cod_receita : integer;
begin

  QRY_MAX_CODIGO.Close;
  QRY_MAX_CODIGO.SQL.Clear;
  QRY_MAX_CODIGO.SQL.Add('SELECT MAX(REC_CODIGO) AS CODIGO FROM CAD_RECEITAS_SITIO');
  QRY_MAX_CODIGO.Open;
  cod_receita := QRY_MAX_CODIGO.FieldByName('CODIGO').AsInteger +1;

  if not IBTRANSLOCAL.InTransaction then
    IBTRANSLOCAL.StartTransaction;
  qry_receita.Close;
  qry_receita.SQL.Clear;
  qry_receita.SQL.Add('INSERT INTO CAD_RECEITAS_SITIO (REC_CODIGO)  '+
                      'VALUES (:REC_CODIGO)                         ');
  qry_receita.ParamByName('REC_CODIGO').AsInteger     := cod_receita;
  qry_receita.ExecSQL;
  IBTRANSLOCAL.Commit;

  txt_codigo.text := inttostr(cod_receita);

  txt_obs.setfocus;

  btnIncluir.Tag := 1;

  btnIncluir.Enabled := false;
  btnAlterar.Enabled := false;
  btnCancelar.Enabled := true;
  btnFinalizar.Enabled := true;
  btnGravar.Enabled := true;

  btnIncluir.tag := 0;

  txt_obs.Clear;
  txt_safra.Clear;
  txt_desc_receita.KeyValue := 0;
  txt_data.Clear;
  txt_valor.Clear;
  txt_total.Clear;

  qry_item.Close;

end;

procedure Tfrm_cad_receitas.txt_safraEnter(Sender: TObject);
begin
  txt_safra.Color := $00F5EEDE;
end;

procedure Tfrm_cad_receitas.txt_safraExit(Sender: TObject);
begin
  txt_safra.Color := clwindow;

  if txt_safra.Text <> '' then
  begin
    if not IBTRANSLOCAL.InTransaction then
      IBTRANSLOCAL.StartTransaction;

    qry_receita.Close;
    qry_receita.SQL.Clear;
    qry_receita.SQL.Add('UPDATE CAD_RECEITAS_SITIO SET SAFRA_ANO=:SAFRA_ANO WHERE REC_CODIGO=:REC_CODIGO ');
    qry_receita.ParamByName('REC_CODIGO').AsString := txt_codigo.Text;
    qry_receita.ParamByName('SAFRA_ANO').AsString := txt_safra.Text;
    qry_receita.ExecSQL;

    IBTRANSLOCAL.Commit;
  end;

end;

procedure Tfrm_cad_receitas.txt_safraKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    txt_desc_receita.SetFocus;
end;

procedure Tfrm_cad_receitas.btnFinalizarClick(Sender: TObject);
begin

  if qry_item.IsEmpty = true then
  begin
    showmessage('Nenhum recebimento cadastrado, por isso nao pode finalizar');
    txt_desc_receita.SetFocus;
    exit;
  end;

  qryTotal.Close;
  qryTotal.SQL.Clear;
  qryTotal.SQL.Add('SELECT SUM(VALOR) AS TOTAL FROM ITENS_RECEITAS_SITIO WHERE REC_CODIGO=:REC_CODIGO');
  qryTotal.ParamByName('REC_CODIGO').AsString := txt_codigo.Text;
  qryTotal.Open;

  if not IBTRANSLOCAL.InTransaction then
    IBTRANSLOCAL.StartTransaction;
  qry_receita.Close;
  qry_receita.SQL.Clear;
  qry_receita.SQL.Add('UPDATE CAD_RECEITAS_SITIO SET VALOR_TOTAL=:VALOR_TOTAL WHERE REC_CODIGO=:REC_CODIGO');
  qry_receita.ParamByName('REC_CODIGO').AsString      := txt_codigo.Text;
  qry_receita.ParamByName('VALOR_TOTAL').AsFloat      := qryTotal.fieldbyname('TOTAL').AsFloat;
  qry_receita.ExecSQL;
  IBTRANSLOCAL.Commit;

  btnIncluir.Tag := 0;

  txt_codigo.Clear;
  txt_obs.Clear;
  txt_safra.Clear;
  txt_total.Clear;

  qry_item.Close;
  qry_item.SQL.Clear;

  btnIncluir.Enabled := true;
  btnAlterar.Enabled := false;
  btnCancelar.Enabled := false;
  btnFinalizar.Enabled := false;
  btnGravar.Enabled := false;

  btnPesquisar.Click;

end;

procedure Tfrm_cad_receitas.DBGrid1DblClick(Sender: TObject);
begin

///////MOSTRA OS DADOS NA GRID e SOMA O TOTAL///////////

  txt_codigo.Text := qryPesquisa.fieldbyname('REC_CODIGO').AsString;
  txt_obs.Text := qryPesquisa.fieldbyname('OBS').AsString;
  txt_safra.Text := qryPesquisa.fieldbyname('SAFRA_ANO').AsString;

  QRY_ITEM.Close;
  qry_item.SQL.Clear;
  qry_item.SQL.Add('SELECT  I.cod_item, T.codigo || '+#39+' - '+#39+' || T.receita AS DESCRICAO_ITEM, '+
                   'I.data, I.valor                                                                   '+
                   'FROM ITENS_RECEITAS_SITIO I, TIPO_RECEITA_SITIO T                                 '+
                   'WHERE I.CODIGO = T.CODIGO AND I.REC_CODIGO =:REC_CODIGO                           ');
  qry_item.ParamByName('REC_CODIGO').AsString := qryPesquisa.fieldbyname('REC_CODIGO').AsString;
  qry_item.Open;

  qryTotal.Close;
  qryTotal.SQL.Clear;
  qryTotal.SQL.Add('SELECT SUM(VALOR) AS TOTAL FROM ITENS_RECEITAS_SITIO WHERE REC_CODIGO=:REC_CODIGO');
  qryTotal.ParamByName('REC_CODIGO').AsString := qryPesquisa.fieldbyname('REC_CODIGO').AsString;
  qryTotal.Open;

  txt_total.Value := qryTotal.fieldbyname('TOTAL').AsFloat;

//////FIM MOSTRA OS DADOS NA GRID E SOMA O TOTAL/////////////

  btnIncluir.Enabled := true;
  btnAlterar.Enabled := true;
  btnFinalizar.Enabled := true;
  btnCancelar.Enabled := false;
  btnGravar.Enabled := false;

end;

procedure Tfrm_cad_receitas.btnAlterarClick(Sender: TObject);
begin
  btnIncluir.Enabled := false;
  btnAlterar.Enabled := false;
  btnCancelar.Enabled := true;
  btnFinalizar.Enabled := true;
  btnGravar.Enabled := true;

  btnAlterar.Tag := 2;

  txt_desc_receita.SetFocus;
end;

procedure Tfrm_cad_receitas.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if key = VK_DELETE then
  begin
    case MessageBox (Application.Handle, Pchar ('Tem certeza que deseja excluir N. ' + qry_item.FieldByName('COD_ITEM').AsString + ' ?'),'Alerta', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1) of
    IDYES:
    begin
      if not IBTRANSLOCAL.InTransaction then
        IBTRANSLOCAL.StartTransaction;
      qry_receita.Close;
      qry_receita.SQL.Clear;
      qry_receita.SQL.Add('DELETE FROM ITENS_RECEITAS_SITIO WHERE COD_ITEM = '+ qry_item.FieldByName('COD_ITEM').AsString);
      qry_receita.ExecSQL;
      IBTRANSLOCAL.Commit;

      ///////MOSTRA OS DADOS NA GRID e SOMA O TOTAL///////////

      QRY_ITEM.Close;
      qry_item.SQL.Clear;
      qry_item.SQL.Add('SELECT  I.cod_item, T.codigo ||'+#39+' - '+#39+' || T.receita AS DESCRICAO_ITEM,  '+
                       'I.data, I.valor                                                                   '+
                       'FROM ITENS_RECEITAS_SITIO I, TIPO_RECEITA_SITIO T                                 '+
                       'WHERE I.CODIGO = T.CODIGO AND I.REC_CODIGO =:REC_CODIGO                           ');
      qry_item.ParamByName('REC_CODIGO').AsString := txt_codigo.Text;
      qry_item.Open;

      qryTotal.Close;
      qryTotal.SQL.Clear;
      qryTotal.SQL.Add('SELECT SUM(VALOR) AS TOTAL FROM ITENS_RECEITAS_SITIO WHERE REC_CODIGO=:REC_CODIGO');
      qryTotal.ParamByName('REC_CODIGO').AsString := txt_codigo.Text;
      qryTotal.Open;

      txt_total.Value := qryTotal.fieldbyname('TOTAL').AsFloat;

   //////FIM MOSTRA OS DADOS NA GRID E SOMA O TOTAL/////////////

      if qry_item.IsEmpty = true then
        btnCancelar.Enabled := true;

    end;//YES
      IDNO : Exit;
    end; //FIM CASE

  end;

end;

procedure Tfrm_cad_receitas.btnCancelarClick(Sender: TObject);
begin
  btnIncluir.Tag := 0;

  if btnIncluir.tag = 2 then
  begin
    if not IBTRANSLOCAL.InTransaction then
      IBTRANSLOCAL.StartTransaction;
      qry_receita.Close;
      qry_receita.SQL.Clear;
      qry_receita.SQL.Add('DELETE FROM CAD_RECEITAS_SITIO WHERE REC_CODIGO = '+ txt_codigo.Text);
      qry_receita.ExecSQL;
    IBTRANSLOCAL.Commit;
  end;

  txt_codigo.Clear;
  txt_obs.Clear;
  txt_safra.Clear;

  btnIncluir.Enabled := true;
  btnAlterar.Enabled := false;
  btnCancelar.Enabled := false;
  btnFinalizar.Enabled := false;
  btnGravar.Enabled := false;

  txt_obs.Clear;
  txt_safra.Clear;
  txt_desc_receita.KeyValue := 0;
  txt_data.Clear;
  txt_valor.Clear;
  txt_total.Clear;

  qry_item.Close;
  
end;

procedure Tfrm_cad_receitas.DBGrid2DrawColumnCell(Sender: TObject;
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
    dbgrid2.Canvas.Font.Color:= clBlack;

  dbgrid2.Canvas.FillRect(Rect);
  dbgrid2.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure Tfrm_cad_receitas.Button1Click(Sender: TObject);
begin
  showmessage('Botão "Finalizar toda a safra", pode-se incluir novas parcelas na mesma safra ou nova OBS na mesma safra com safra finalizada');
end;

end.
