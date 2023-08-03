object frm_cad_receitas: Tfrm_cad_receitas
  Left = 254
  Top = 96
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro Recebimentos'
  ClientHeight = 625
  ClientWidth = 814
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label11: TLabel
    Left = 16
    Top = 56
    Width = 40
    Height = 16
    Caption = 'OBS :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 610
    Top = 56
    Width = 75
    Height = 16
    Caption = 'Safra(Ano)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 16
    Top = 5
    Width = 33
    Height = 13
    Caption = 'Codigo'
  end
  object Label12: TLabel
    Left = 561
    Top = 583
    Width = 136
    Height = 16
    Alignment = taCenter
    AutoSize = False
    Caption = 'Valor Total (R$)'
    Color = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 346
    Width = 689
    Height = 71
    Caption = 'Pesquisar Safra'
    TabOrder = 0
    object Label10: TLabel
      Left = 10
      Top = 20
      Width = 50
      Height = 13
      Caption = 'Safra(Ano)'
    end
    object btnPesquisar: TButton
      Left = 110
      Top = 27
      Width = 86
      Height = 30
      Caption = 'Pesquisar'
      TabOrder = 0
      OnClick = btnPesquisarClick
    end
    object txt_safra_pesq: TEdit
      Left = 8
      Top = 35
      Width = 88
      Height = 21
      TabOrder = 1
    end
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 423
    Width = 689
    Height = 153
    DataSource = dsPesquisa
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 1
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
        FieldName = 'REC_CODIGO'
        Title.Alignment = taCenter
        Title.Caption = 'Codigo'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SAFRA_ANO'
        Title.Alignment = taCenter
        Title.Caption = 'Safra(Ano)'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBS'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 400
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_TOTAL'
        Title.Alignment = taRightJustify
        Title.Caption = 'Total (R$)'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 100
        Visible = True
      end>
  end
  object btnRelatorio: TButton
    Left = 18
    Top = 586
    Width = 90
    Height = 33
    Caption = 'Relatorio'
    TabOrder = 2
    OnClick = btnRelatorioClick
  end
  object txt_obs: TEdit
    Left = 11
    Top = 73
    Width = 590
    Height = 24
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 64
    ParentFont = False
    TabOrder = 3
    OnEnter = txt_obsEnter
    OnExit = txt_obsExit
    OnKeyPress = txt_obsKeyPress
  end
  object txt_safra: TEdit
    Left = 608
    Top = 72
    Width = 77
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 4
    ParentFont = False
    TabOrder = 4
    OnEnter = txt_safraEnter
    OnExit = txt_safraExit
    OnKeyPress = txt_safraKeyPress
  end
  object txt_codigo: TEdit
    Left = 16
    Top = 19
    Width = 41
    Height = 21
    Color = clMenuBar
    ReadOnly = True
    TabOrder = 5
  end
  object btnIncluir: TButton
    Left = 61
    Top = 12
    Width = 297
    Height = 30
    Hint = 
      'Aqui vc pode inserir uma nova safra(digitando um novo ano) ou co' +
      'locar uma nova OBS digitando um ano ja existente em alguma safra'
    Caption = 'Incluir Nova Safra ou Inserir uma nova OBS na mesma safra  '
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = btnIncluirClick
  end
  object btnFinalizar: TButton
    Left = 700
    Top = 17
    Width = 110
    Height = 25
    Caption = 'Finalizar toda a safra'
    TabOrder = 7
    OnClick = btnFinalizarClick
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 102
    Width = 777
    Height = 242
    Caption = 'PARCELA'
    TabOrder = 8
    object Label2: TLabel
      Left = 10
      Top = 24
      Width = 129
      Height = 13
      Caption = 'Descri'#231#227'o do Recebimento'
    end
    object Label3: TLabel
      Left = 480
      Top = 23
      Width = 51
      Height = 13
      Caption = 'Valor Total'
    end
    object Label4: TLabel
      Left = 357
      Top = 24
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object Label6: TLabel
      Left = 547
      Top = 200
      Width = 136
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = 'Valor Total (R$)'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object txt_Valor: TCurrencyEdit
      Left = 480
      Top = 41
      Width = 103
      Height = 21
      AutoSize = False
      TabOrder = 0
      OnEnter = txt_ValorEnter
      OnExit = txt_ValorExit
      OnKeyPress = txt_valorKeyPress
    end
    object txt_data: TDateEdit
      Left = 354
      Top = 41
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
      OnEnter = txt_dataEnter
      OnExit = txt_dataExit
      OnKeyPress = txt_dataKeyPress
    end
    object txt_desc_receita: TDBLookupComboBox
      Left = 8
      Top = 41
      Width = 339
      Height = 21
      KeyField = 'CODIGO'
      ListField = 'REC'
      ListSource = ds_receita
      TabOrder = 2
      OnEnter = txt_desc_receitaEnter
      OnExit = txt_desc_receitaExit
      OnKeyPress = txt_desc_receitaKeyPress
    end
    object btnGravar: TButton
      Left = 586
      Top = 39
      Width = 183
      Height = 30
      Caption = 'Gravar nova parcela na mesma safra'
      TabOrder = 3
      OnClick = btnGravarClick
    end
    object DBGrid2: TDBGrid
      Left = 8
      Top = 75
      Width = 675
      Height = 123
      DataSource = ds_item
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid2DrawColumnCell
      OnKeyDown = DBGrid2KeyDown
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'COD_ITEM'
          Title.Alignment = taCenter
          Title.Caption = 'Codigo'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO_ITEM'
          Title.Caption = 'Descri'#231#227'o do Recebimento'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 350
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATA'
          Title.Alignment = taCenter
          Title.Caption = 'Data Receb.'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Title.Alignment = taRightJustify
          Title.Caption = 'Valor (R$)'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 100
          Visible = True
        end>
    end
    object txt_total: TCurrencyEdit
      Left = 547
      Top = 217
      Width = 136
      Height = 21
      AutoSize = False
      Color = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
  end
  object TXT_TOTAL_SAFRA: TCurrencyEdit
    Left = 561
    Top = 600
    Width = 136
    Height = 21
    AutoSize = False
    Color = 16776176
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 9
  end
  object btnAlterar: TButton
    Left = 365
    Top = 16
    Width = 266
    Height = 25
    Hint = 
      'Aqui vc so vai colocar uma nova "Descri'#231#227'o do Recebimento" "Data' +
      '" e "Valor Total"'
    Caption = 'Incluir nova parcela na mesma safra c/ mesma OBS'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    OnClick = btnAlterarClick
  end
  object btnCancelar: TButton
    Left = 636
    Top = 17
    Width = 61
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 11
    OnClick = btnCancelarClick
  end
  object Button1: TButton
    Left = 344
    Top = 584
    Width = 113
    Height = 33
    Caption = 'AJUDA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
    OnClick = Button1Click
  end
  object qry_receita: TIBQuery
    Database = dm.BD
    Transaction = IBTransLocal
    BufferChunks = 1000
    CachedUpdates = False
    Left = 248
    Top = 212
  end
  object IBTransLocal: TIBTransaction
    Active = False
    DefaultDatabase = dm.BD
    AutoStopAction = saNone
    Left = 288
    Top = 212
  end
  object QRY_MAX_CODIGO: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 328
    Top = 212
  end
  object qry_tipo_receita: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT CODIGO, CODIGO ||'#39' - '#39'|| RECEITA AS REC FROM TIPO_RECEITA')
    Left = 408
    Top = 214
    object qry_tipo_receitaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'TIPO_RECEITA.CODIGO'
      Required = True
    end
    object qry_tipo_receitaREC: TIBStringField
      FieldName = 'REC'
      Size = 78
    end
  end
  object ds_receita: TDataSource
    DataSet = qry_tipo_receita
    Left = 376
    Top = 214
  end
  object qryPesquisa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM CAD_RECEITAS_SITIO')
    Left = 304
    Top = 498
    object qryPesquisaREC_CODIGO: TIntegerField
      FieldName = 'REC_CODIGO'
      Origin = 'CAD_RECEITAS_SITIO.REC_CODIGO'
      Required = True
    end
    object qryPesquisaOBS: TIBStringField
      FieldName = 'OBS'
      Origin = 'CAD_RECEITAS_SITIO.OBS'
      Size = 64
    end
    object qryPesquisaSAFRA_ANO: TIBStringField
      FieldName = 'SAFRA_ANO'
      Origin = 'CAD_RECEITAS_SITIO.SAFRA_ANO'
      Size = 4
    end
    object qryPesquisaVALOR_TOTAL: TIBBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'CAD_RECEITAS_SITIO.VALOR_TOTAL'
      DisplayFormat = '###,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object dsPesquisa: TDataSource
    DataSet = qryPesquisa
    Left = 264
    Top = 498
  end
  object qryTotal: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 160
    Top = 518
  end
  object qry_pesquisa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 440
    Top = 214
  end
  object qry_item: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT  I.cod_item, T.codigo || '#39' - '#39' || T.receita AS DESCRICAO_' +
        'ITEM,'
      'I.data, I.valor'
      'FROM ITENS_RECEITAS_SITIO I, TIPO_RECEITA_SITIO T')
    Left = 80
    Top = 199
    object qry_itemCOD_ITEM: TIntegerField
      FieldName = 'COD_ITEM'
      Origin = 'ITENS_RECEITAS_SITIO.COD_ITEM'
      Required = True
    end
    object qry_itemDESCRICAO_ITEM: TIBStringField
      FieldName = 'DESCRICAO_ITEM'
      Size = 78
    end
    object qry_itemDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'ITENS_RECEITAS_SITIO.DATA'
    end
    object qry_itemVALOR: TIBBCDField
      FieldName = 'VALOR'
      Origin = 'ITENS_RECEITAS_SITIO.VALOR'
      DisplayFormat = '###,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object ds_item: TDataSource
    DataSet = qry_item
    Left = 48
    Top = 199
  end
  object qry_pesquisa_ano: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 760
    Top = 64
  end
end
