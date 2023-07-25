unit untCadTipoDespesa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, IBCustomDataSet, IBQuery,
  IBDatabase;

type
  TfrmCadTipoDespesa = class(TForm)
    gpbDados: TGroupBox;
    Label1: TLabel;
    txt_codigo: TEdit;
    Label2: TLabel;
    txt_descricao: TEdit;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    btnGravar: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    qryTipoDespesa: TIBQuery;
    dsTipoDespesa: TDataSource;
    qry_trans_local: TIBQuery;
    IBTransLocal: TIBTransaction;
    QRY_MAX_CODIGO: TIBQuery;
    btnInserir: TButton;
    qryPesquisa: TIBQuery;
    qryTipoDespesaTIP_CODIGO_SIT: TIntegerField;
    qryTipoDespesaTIP_DESCRICAO_SIT: TIBStringField;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure txt_descricaoEnter(Sender: TObject);
    procedure txt_descricaoExit(Sender: TObject);
    procedure txt_descricaoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTipoDespesa: TfrmCadTipoDespesa;

implementation

uses unt_modulo;

{$R *.dfm}

procedure TfrmCadTipoDespesa.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfrmCadTipoDespesa.txt_descricaoEnter(Sender: TObject);
begin
  txt_descricao.Color := $00F5EEDE;
end;

procedure TfrmCadTipoDespesa.txt_descricaoExit(Sender: TObject);
begin
  txt_descricao.Color := clwindow;
end;

procedure TfrmCadTipoDespesa.txt_descricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
    btnGravar.SetFocus;
end;

procedure TfrmCadTipoDespesa.FormShow(Sender: TObject);
begin

  btnAlterar.Enabled := false;
  btnExcluir.Enabled := false;
  btnGravar.Enabled := false;

  gpbDados.Enabled := false;

  //MOSTRA OS DADOS NA GRID
  qryTipoDespesa.Close;
  qryTipoDespesa.SQL.Clear;
  qryTipoDespesa.SQL.Add('SELECT * FROM TIPO_DESPESA_SITIO');
  qryTipoDespesa.Open;
  qryTipoDespesa.FetchAll;

end;

procedure TfrmCadTipoDespesa.btnGravarClick(Sender: TObject);
var
  cod_tipo : integer;
begin

  if txt_codigo.Text = '' then
  begin
    showmessage('Coloque o codigo');
    txt_codigo.SetFocus;
    exit;
  end;

  if txt_descricao.Text = '' then
  begin
    showmessage('Coloque a descricao');
    txt_descricao.SetFocus;
    exit;
  end;


  if btnInserir.Tag = 1 then
  begin
    if not IBTRANSLOCAL.InTransaction then
      IBTRANSLOCAL.StartTransaction;

    qry_trans_local.Close;
    qry_trans_local.SQL.Clear;
    qry_trans_local.SQL.Add('INSERT INTO TIPO_DESPESA_SITIO (TIP_CODIGO_SIT, TIP_DESCRICAO_SIT)  '+
                      'VALUES (:TIP_CODIGO_SIT, :TIP_DESCRICAO_SIT)');
    qry_trans_local.ParamByName('TIP_CODIGO_SIT').AsString          := txt_Codigo.Text;
    qry_trans_local.ParamByName('TIP_DESCRICAO_SIT').AsString       := txt_descricao.Text;
    qry_trans_local.ExecSQL;

    IBTRANSLOCAL.Commit;

  end;

  if btnalterar.Tag = 2 then
  begin

    if not IBTRANSLOCAL.InTransaction then
      IBTRANSLOCAL.StartTransaction;

    qry_trans_local.Close;
    qry_trans_local.SQL.Clear;
    qry_trans_local.SQL.Add('UPDATE TIPO_DESPESA_SITIO SET TIP_DESCRICAO_SIT=:TIP_DESCRICAO_SIT WHERE TIP_CODIGO_SIT=:TIP_CODIGO_SIT');
    qry_trans_local.ParamByName('TIP_CODIGO_SIT').AsString          := txt_codigo.Text;
    qry_trans_local.ParamByName('TIP_DESCRICAO_SIT').AsString       := txt_descricao.Text;
    qry_trans_local.ExecSQL;

    IBTRANSLOCAL.Commit;

  end;

  txt_codigo.Clear;
  txt_descricao.Clear;

  gpbDados.Enabled := false;

  btnGravar.Enabled := false;

  //MOSTRA OS DADOS NA GRID
  qryTipoDespesa.Close;
  qryTipoDespesa.SQL.Clear;
  qryTipoDespesa.SQL.Add('SELECT * FROM TIPO_DESPESA_SITIO');
  qryTipoDespesa.Open;
  qryTipoDespesa.FetchAll;

  btninserir.Tag := 0;
  btnAlterar.Tag := 0;

  btnexcluir.Enabled := true;
  btnalterar.Enabled := true;
  btnInserir.Enabled := true;

end;

procedure TfrmCadTipoDespesa.DBGrid1DblClick(Sender: TObject);
begin
  txt_codigo.Text := qryTipoDespesa.fieldbyname('TIP_CODIGO_SIT').AsString;
  txt_descricao.Text := qryTipoDespesa.fieldbyname('TIP_DESCRICAO_SIT').AsString;

  gpbDados.Enabled := false;

  btnAlterar.Enabled := true;
  btnExcluir.Enabled := true;
  btnGravar.Enabled := false;

end;

procedure TfrmCadTipoDespesa.btnInserirClick(Sender: TObject);
var
  cod_tipo : integer;
begin

  gpbDados.Enabled := true;

  btnInserir.Tag := 1;

  txt_codigo.Clear;
  txt_descricao.Clear;
  txt_DESCRICAO.SetFocus;

  btnAlterar.Enabled := false;
  btnExcluir.Enabled := false;
  btnGravar.Enabled := true;

  QRY_MAX_CODIGO.Close;
  QRY_MAX_CODIGO.SQL.Clear;
  QRY_MAX_CODIGO.SQL.Add('SELECT MAX(TIP_CODIGO_SIT) AS TIP_CODIGO_SIT FROM TIPO_DESPESA_SITIO');
  QRY_MAX_CODIGO.Open;
  cod_tipo := QRY_MAX_CODIGO.FieldByName('TIP_CODIGO_SIT').AsInteger +1;

  txt_codigo.Text := inttostr(cod_tipo);

  btnexcluir.Enabled := false;
  btnalterar.Enabled := false;
  btnInserir.Enabled := false;

end;

procedure TfrmCadTipoDespesa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmCadTipoDespesa := nil;
  action:= cafree;
end;

procedure TfrmCadTipoDespesa.btnAlterarClick(Sender: TObject);
begin
  btnAlterar.Tag := 2;
  gpbDados.Enabled := true;

  btnGravar.Enabled := true;

  btnexcluir.Enabled := false;

  btnalterar.Enabled := false;

end;

procedure TfrmCadTipoDespesa.btnExcluirClick(Sender: TObject);
begin

  if txt_codigo.Text = '' then
  begin
    showmessage('Duplo clique no registro que deseja excluir');   
    exit;
  end;


  case MessageBox (Application.Handle, Pchar ('Tem certeza que deseja excluir N. ' + txt_codigo.Text + ' ?'),'Alerta', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1) of
  IDYES:
  begin

    if not IBTRANSLOCAL.InTransaction then
      IBTRANSLOCAL.StartTransaction;
      qry_trans_local.Close;
      qry_trans_local.SQL.Clear;
      qry_trans_local.SQL.Add('DELETE FROM TIPO_DESPESA_SITIO WHERE TIP_CODIGO_SIT =:TIP_CODIGO_SIT');
      qry_trans_local.ParamByName('TIP_CODIGO_SIT').AsString := txt_codigo.Text;
      qry_trans_local.ExecSQL;
    IBTRANSLOCAL.Commit;

    txt_codigo.Clear;
    txt_descricao.Clear;

    gpbDados.Enabled := false;

    btnGravar.Enabled := false;

    //MOSTRA OS DADOS NA GRID
    qryTipoDespesa.Close;
    qryTipoDespesa.SQL.Clear;
    qryTipoDespesa.SQL.Add('SELECT * FROM TIPO_DESPESA_SITIO');
    qryTipoDespesa.Open;
    qryTipoDespesa.FetchAll;

  END;
   IDNO : Exit;
 end; //FIM CASE

end;

end.
