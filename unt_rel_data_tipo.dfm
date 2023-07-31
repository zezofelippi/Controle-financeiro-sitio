object frm_rel_data_tipo: Tfrm_rel_data_tipo
  Left = 246
  Top = 193
  Align = alClient
  BorderStyle = bsDialog
  Caption = 'Relatorio Geral'
  ClientHeight = 469
  ClientWidth = 900
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 900
    Height = 137
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 53
      Height = 13
      Caption = 'Data Inicial'
    end
    object Label2: TLabel
      Left = 121
      Top = 24
      Width = 48
      Height = 13
      Caption = 'Data Final'
    end
    object Label3: TLabel
      Left = 12
      Top = 69
      Width = 64
      Height = 13
      Caption = 'Tipo despesa'
    end
    object Label4: TLabel
      Left = 8
      Top = 64
      Width = 3
      Height = 13
    end
    object Label5: TLabel
      Left = 312
      Top = 72
      Width = 74
      Height = 13
      Caption = 'Despesa outros'
    end
    object Button1: TButton
      Left = 664
      Top = 82
      Width = 137
      Height = 25
      Caption = 'Visualizar Dados'
      TabOrder = 0
      OnClick = Button1Click
    end
    object txt_despesa_outros: TEdit
      Left = 309
      Top = 86
      Width = 348
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      OnEnter = txt_despesa_outrosEnter
      OnExit = txt_despesa_outrosExit
      OnKeyPress = txt_despesa_outrosKeyPress
    end
    object GroupBox2: TGroupBox
      Left = 679
      Top = 7
      Width = 202
      Height = 60
      Caption = 'Dias da Semana'
      TabOrder = 2
      Visible = False
      object Label7: TLabel
        Left = 11
        Top = 18
        Width = 43
        Height = 13
        Caption = 'Segunda'
      end
      object Label8: TLabel
        Left = 91
        Top = 19
        Width = 28
        Height = 13
        Caption = 'Ter'#231'a'
      end
      object Label9: TLabel
        Left = 171
        Top = 19
        Width = 32
        Height = 13
        Caption = 'Quarta'
      end
      object Label10: TLabel
        Left = 252
        Top = 19
        Width = 31
        Height = 13
        Caption = 'Quinta'
      end
      object Label11: TLabel
        Left = 331
        Top = 20
        Width = 27
        Height = 13
        Caption = 'Sexta'
      end
      object Label12: TLabel
        Left = 414
        Top = 19
        Width = 37
        Height = 13
        Caption = 'Sabado'
      end
      object Label13: TLabel
        Left = 495
        Top = 19
        Width = 42
        Height = 13
        Caption = 'Domingo'
      end
      object cbo_segunda: TComboBox
        Left = 8
        Top = 32
        Width = 81
        Height = 21
        Style = csDropDownList
        CharCase = ecUpperCase
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          'SEGUNDA')
      end
      object cbo_terca: TComboBox
        Left = 88
        Top = 32
        Width = 81
        Height = 21
        Style = csDropDownList
        CharCase = ecUpperCase
        ItemHeight = 13
        TabOrder = 1
        Items.Strings = (
          'TERCA')
      end
      object cbo_quarta: TComboBox
        Left = 168
        Top = 32
        Width = 81
        Height = 21
        Style = csDropDownList
        CharCase = ecUpperCase
        ItemHeight = 13
        TabOrder = 2
        Items.Strings = (
          'QUARTA')
      end
      object cbo_quinta: TComboBox
        Left = 250
        Top = 32
        Width = 81
        Height = 21
        Style = csDropDownList
        CharCase = ecUpperCase
        ItemHeight = 13
        TabOrder = 3
        Items.Strings = (
          'QUINTA')
      end
      object cbo_sexta: TComboBox
        Left = 330
        Top = 32
        Width = 81
        Height = 21
        Style = csDropDownList
        CharCase = ecUpperCase
        ItemHeight = 13
        TabOrder = 4
        Items.Strings = (
          'SEXTA')
      end
      object cbo_sabado: TComboBox
        Left = 410
        Top = 32
        Width = 81
        Height = 21
        Style = csDropDownList
        CharCase = ecUpperCase
        ItemHeight = 13
        TabOrder = 5
        Items.Strings = (
          'SABADO')
      end
      object cbo_domingo: TComboBox
        Left = 491
        Top = 32
        Width = 81
        Height = 21
        Style = csDropDownList
        CharCase = ecUpperCase
        ItemHeight = 13
        TabOrder = 6
        Items.Strings = (
          'DOMINGO')
      end
    end
    object txt_data_i: TDateEdit
      Left = 6
      Top = 39
      Width = 104
      Height = 21
      NumGlyphs = 2
      TabOrder = 3
      OnEnter = txt_data_iEnter
      OnExit = txt_data_iExit
      OnKeyPress = txt_data_iKeyPress
    end
    object txt_data_f: TDateEdit
      Left = 117
      Top = 39
      Width = 101
      Height = 21
      NumGlyphs = 2
      TabOrder = 4
      OnEnter = txt_data_fEnter
      OnExit = txt_data_fExit
      OnKeyPress = txt_data_fKeyPress
    end
    object rdb_inicio: TRadioButton
      Left = 320
      Top = 112
      Width = 57
      Height = 17
      Caption = 'Inicio'
      TabOrder = 5
    end
    object rdb_posicao: TRadioButton
      Left = 408
      Top = 112
      Width = 113
      Height = 17
      Caption = 'Qualquer posicao'
      TabOrder = 6
    end
    object cboDespesa: TDBLookupComboBox
      Left = 8
      Top = 86
      Width = 289
      Height = 21
      KeyField = 'TIP_CODIGO_SIT'
      ListField = 'DESPESA'
      ListSource = dsDespesa
      TabOrder = 7
      OnEnter = cboDespesaEnter
      OnExit = cboDespesaExit
      OnKeyDown = cboDespesaKeyDown
      OnKeyPress = cboDespesaKeyPress
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 408
    Width = 900
    Height = 61
    Align = alBottom
    TabOrder = 1
    object Label6: TLabel
      Left = 829
      Top = 16
      Width = 136
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = 'Total'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object txt_total: TCurrencyEdit
      Left = 829
      Top = 32
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
      TabOrder = 0
    end
    object btnRelatorio: TButton
      Left = 8
      Top = 19
      Width = 88
      Height = 29
      Caption = 'Relatorio'
      TabOrder = 1
      OnClick = btnRelatorioClick
    end
    object rdg_organizado: TRadioGroup
      Left = 112
      Top = 11
      Width = 185
      Height = 41
      Caption = 'Organizado Por:'
      Columns = 2
      Items.Strings = (
        'Por Mes'
        'Por Ano')
      TabOrder = 2
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 137
    Width = 900
    Height = 271
    Align = alClient
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 896
      Height = 254
      Align = alClient
      DataSource = ds_pesquisa
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnTitleClick = DBGrid1TitleClick
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATA'
          Title.Alignment = taCenter
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
          Alignment = taCenter
          Expanded = False
          FieldName = 'CODIGO'
          Title.Alignment = taCenter
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
          FieldName = 'DESPESA'
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
          Expanded = False
          FieldName = 'DESPESA_OUTROS'
          Title.Caption = 'DESCRI'#199#195'O DA DESPESA'
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
          FieldName = 'VALOR'
          Title.Alignment = taCenter
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 100
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CONTAS_PAGAR_ID'
          Title.Caption = 'Cod Contas Pagar'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end>
    end
  end
  object qry_pesquisa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT CA.codigo, CA.despesa_outros, CA.valor, CA.data, CA.seman' +
        'a,'
      
        'T.tip_codigo_SIT ||'#39' - '#39'|| T.tip_descricao_sit AS DESPESA, CA.CO' +
        'NTAS_PAGAR_ID'
      'FROM CAD_DESPESA_SITIO CA, TIPO_DESPESA_SITIO T'
      '')
    Left = 368
    Top = 176
    object qry_pesquisaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CAD_DESPESA.CODIGO'
      Required = True
    end
    object qry_pesquisaDESPESA_OUTROS: TIBStringField
      FieldName = 'DESPESA_OUTROS'
      Origin = 'CAD_DESPESA.DESPESA_OUTROS'
      Size = 150
    end
    object qry_pesquisaVALOR: TIBBCDField
      FieldName = 'VALOR'
      Origin = 'CAD_DESPESA.VALOR'
      DisplayFormat = 'R$ ###,##0.00'
      Precision = 18
      Size = 2
    end
    object qry_pesquisaDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'CAD_DESPESA.DATA'
    end
    object qry_pesquisaSEMANA: TIBStringField
      FieldName = 'SEMANA'
      Origin = 'CAD_DESPESA.SEMANA'
      Size = 15
    end
    object qry_pesquisaDESPESA: TIBStringField
      FieldName = 'DESPESA'
      Size = 78
    end
    object qry_pesquisaCONTAS_PAGAR_ID: TIntegerField
      FieldName = 'CONTAS_PAGAR_ID'
      Origin = 'CAD_DESPESA_SITIO.CONTAS_PAGAR_ID'
    end
  end
  object ds_pesquisa: TDataSource
    DataSet = qry_pesquisa
    Left = 328
    Top = 169
  end
  object qry_soma: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 464
    Top = 169
  end
  object qryDespesa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT TIP_CODIGO_SIT, TIP_DESCRICAO_SIT, TIP_CODIGO_SIT ||'#39' - '#39 +
        '|| TIP_DESCRICAO_SIT AS DESPESA FROM TIPO_DESPESA_SITIO')
    Left = 152
    Top = 72
    object qryDespesaTIP_CODIGO_SIT: TIntegerField
      FieldName = 'TIP_CODIGO_SIT'
      Origin = 'TIPO_DESPESA_SITIO.TIP_CODIGO_SIT'
      Required = True
    end
    object qryDespesaTIP_DESCRICAO_SIT: TIBStringField
      FieldName = 'TIP_DESCRICAO_SIT'
      Origin = 'TIPO_DESPESA_SITIO.TIP_DESCRICAO_SIT'
      Size = 64
    end
    object qryDespesaDESPESA: TIBStringField
      FieldName = 'DESPESA'
      Size = 78
    end
  end
  object dsDespesa: TDataSource
    DataSet = qryDespesa
    Left = 112
    Top = 72
  end
end
