object frmCadTipoDespesa: TfrmCadTipoDespesa
  Left = 414
  Top = 196
  BorderStyle = bsSingle
  Caption = 'Cad. Tipo de Despesa'
  ClientHeight = 387
  ClientWidth = 580
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object gpbDados: TGroupBox
    Left = 0
    Top = 2
    Width = 447
    Height = 111
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 33
      Height = 13
      Caption = 'Codigo'
    end
    object Label2: TLabel
      Left = 16
      Top = 56
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object txt_codigo: TEdit
      Left = 17
      Top = 24
      Width = 96
      Height = 21
      Color = 16776176
      ReadOnly = True
      TabOrder = 0
    end
    object txt_descricao: TEdit
      Left = 16
      Top = 72
      Width = 425
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      OnEnter = txt_descricaoEnter
      OnExit = txt_descricaoExit
      OnKeyPress = txt_descricaoKeyPress
    end
  end
  object GroupBox1: TGroupBox
    Left = 448
    Top = 2
    Width = 129
    Height = 175
    TabOrder = 1
    object btnGravar: TButton
      Left = 8
      Top = 55
      Width = 113
      Height = 33
      Caption = 'Gravar'
      TabOrder = 0
      OnClick = btnGravarClick
    end
    object btnAlterar: TButton
      Left = 8
      Top = 90
      Width = 113
      Height = 32
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = btnAlterarClick
    end
    object btnExcluir: TButton
      Left = 8
      Top = 124
      Width = 113
      Height = 32
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = btnExcluirClick
    end
    object btnInserir: TButton
      Left = 8
      Top = 20
      Width = 113
      Height = 33
      Caption = 'Inserir'
      TabOrder = 3
      OnClick = btnInserirClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 120
    Width = 438
    Height = 262
    DataSource = dsTipoDespesa
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TIP_CODIGO_SIT'
        Title.Alignment = taCenter
        Title.Caption = 'Codigo'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIP_DESCRICAO_SIT'
        Title.Caption = 'Descri'#231#227'o'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 300
        Visible = True
      end>
  end
  object qryTipoDespesa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from tipo_despesa_SITIO')
    Left = 216
    Top = 152
    object qryTipoDespesaTIP_CODIGO_SIT: TIntegerField
      FieldName = 'TIP_CODIGO_SIT'
      Origin = 'TIPO_DESPESA_SITIO.TIP_CODIGO_SIT'
      Required = True
    end
    object qryTipoDespesaTIP_DESCRICAO_SIT: TIBStringField
      FieldName = 'TIP_DESCRICAO_SIT'
      Origin = 'TIPO_DESPESA_SITIO.TIP_DESCRICAO_SIT'
      Size = 64
    end
  end
  object dsTipoDespesa: TDataSource
    DataSet = qryTipoDespesa
    Left = 176
    Top = 152
  end
  object qry_trans_local: TIBQuery
    Database = dm.BD
    Transaction = IBTransLocal
    BufferChunks = 1000
    CachedUpdates = False
    Left = 472
    Top = 208
  end
  object IBTransLocal: TIBTransaction
    Active = False
    DefaultDatabase = dm.BD
    AutoStopAction = saNone
    Left = 504
    Top = 208
  end
  object QRY_MAX_CODIGO: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 216
    Top = 192
  end
  object qryPesquisa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 264
    Top = 184
  end
end
