object frmLeituraCPFL: TfrmLeituraCPFL
  Left = 293
  Top = 250
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Leitura CPFL'
  ClientHeight = 453
  ClientWidth = 770
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 303
    Top = 16
    Width = 58
    Height = 13
    Caption = 'Data Leitura'
  end
  object lbl2: TLabel
    Left = 399
    Top = 16
    Width = 32
    Height = 13
    Caption = 'Leitura'
  end
  object lbl3: TLabel
    Left = 8
    Top = 64
    Width = 654
    Height = 13
    Caption = 
      '________________________________________________________________' +
      '_____________________________________________'
  end
  object lbl4: TLabel
    Left = 304
    Top = 94
    Width = 53
    Height = 13
    Caption = 'Data Inicial'
  end
  object lbl5: TLabel
    Left = 17
    Top = 16
    Width = 27
    Height = 13
    Caption = 'Lugar'
  end
  object lbl6: TLabel
    Left = 17
    Top = 91
    Width = 27
    Height = 13
    Caption = 'Lugar'
  end
  object lbl7: TLabel
    Left = 406
    Top = 94
    Width = 48
    Height = 13
    Caption = 'Data Final'
  end
  object lbl8: TLabel
    Left = 499
    Top = 15
    Width = 24
    Height = 13
    Caption = 'Valor'
  end
  object lbl9: TLabel
    Left = 591
    Top = 92
    Width = 58
    Height = 13
    Caption = 'Media KWH'
  end
  object lbl10: TLabel
    Left = 648
    Top = 406
    Width = 52
    Height = 13
    Caption = 'TOTAL R$'
  end
  object edt_data: TDateEdit
    Left = 303
    Top = 34
    Width = 88
    Height = 21
    NumGlyphs = 2
    TabOrder = 0
  end
  object edtLeitura: TEdit
    Left = 399
    Top = 32
    Width = 92
    Height = 21
    TabOrder = 1
    OnKeyPress = edtLeituraKeyPress
  end
  object btnGravar: TButton
    Left = 585
    Top = 30
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 2
    OnClick = btnGravarClick
  end
  object grd1: TDBGrid
    Left = 8
    Top = 140
    Width = 753
    Height = 262
    DataSource = dtsPesquisa
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = grd1DrawColumnCell
    OnDblClick = grd1DblClick
    OnTitleClick = grd1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'LUGAR'
        Title.Alignment = taCenter
        Title.Caption = 'Lugar'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA'
        Title.Alignment = taCenter
        Title.Caption = 'Data Leitura'
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
        Expanded = False
        FieldName = 'NUMERO_LEITURA'
        Title.Alignment = taCenter
        Title.Caption = 'Leitura Atual'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO_LEITURA_ANTERIOR'
        Title.Alignment = taCenter
        Title.Caption = 'Leitura Anterior'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Visible = True
      end
      item
        Color = 16777183
        Expanded = False
        FieldName = 'KWH'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = 'QTDE KWh'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Visible = True
      end
      item
        Color = 16763283
        Expanded = False
        FieldName = 'KWHX10'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = 'KWH * 10'
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
        FieldName = 'VALOR'
        Title.Alignment = taCenter
        Title.Caption = 'Valor(R$)'
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
  object edtDataInicial: TDateEdit
    Left = 302
    Top = 112
    Width = 88
    Height = 21
    NumGlyphs = 2
    TabOrder = 4
  end
  object btnPesquisar: TButton
    Left = 501
    Top = 107
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 5
    OnClick = btnPesquisarClick
  end
  object cboLugar: TDBLookupComboBox
    Left = 13
    Top = 33
    Width = 280
    Height = 21
    KeyField = 'CPFL_CODIGO'
    ListField = 'LUGAR'
    ListSource = dtsLugar
    TabOrder = 6
  end
  object cboPesqLugar: TDBLookupComboBox
    Left = 13
    Top = 110
    Width = 279
    Height = 21
    KeyField = 'CPFL_CODIGO'
    ListField = 'LUGAR'
    ListSource = dtsLugar
    TabOrder = 7
  end
  object edtDataFinal: TDateEdit
    Left = 404
    Top = 110
    Width = 88
    Height = 21
    NumGlyphs = 2
    TabOrder = 8
  end
  object edt_Valor: TCurrencyEdit
    Left = 498
    Top = 31
    Width = 76
    Height = 21
    AutoSize = False
    TabOrder = 9
  end
  object edtMedia: TRxCalcEdit
    Left = 589
    Top = 109
    Width = 116
    Height = 21
    AutoSize = False
    Color = 16764831
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 10
  end
  object edtCodigo: TEdit
    Left = 680
    Top = 72
    Width = 59
    Height = 21
    TabOrder = 11
    Visible = False
  end
  object edtTotal: TCurrencyEdit
    Left = 648
    Top = 424
    Width = 110
    Height = 21
    AutoSize = False
    Color = 16764831
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 12
  end
  object dtsLugar: TDataSource
    DataSet = qryLugar
    Left = 160
    Top = 24
  end
  object qryLugar: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT CPFL_CODIGO ||'#39' - '#39'|| CPFL_LUGAR AS LUGAR, CPFL_CODIGO'
      'FROM CAD_LUGAR_LEITURA_CPFL')
    Left = 208
    Top = 24
    object ibstrngfldLugarLUGAR: TIBStringField
      FieldName = 'LUGAR'
      Size = 114
    end
    object qryLugarCPFL_CODIGO: TIntegerField
      FieldName = 'CPFL_CODIGO'
      Origin = 'CAD_LUGAR_LEITURA_CPFL.CPFL_CODIGO'
      Required = True
    end
  end
  object IBTRANSLOCAL: TIBTransaction
    Active = False
    DefaultDatabase = dm.BD
    AutoStopAction = saNone
    Left = 675
    Top = 24
  end
  object qry_movimento: TIBQuery
    Database = dm.BD
    Transaction = IBTRANSLOCAL
    BufferChunks = 1000
    CachedUpdates = False
    Left = 707
    Top = 24
  end
  object qryAux: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 600
    Top = 184
  end
  object qryPesquisa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT DATA, NUMERO_LEITURA, VALOR, KWH, NUMERO_LEITURA_ANTERIOR' +
        ', CODIGO_CPFL, C.CPFL_CODIGO,'
      '    C.cpfl_codigo ||'#39' - '#39'|| C.cpfl_lugar AS LUGAR,'
      '    case'
      '    when NUMERO_LEITURA_ANTERIOR > 0 THEN'
      '      SUM( (NUMERO_LEITURA -NUMERO_LEITURA_ANTERIOR) * 10 )'
      '    ELSE'
      '      0'
      '    END  KWHX10'
      '   FROM LEITURA_CPFL L INNER join cad_lugar_leitura_cpfl C ON'
      '    L.cpfl_codigo = C.cpfl_codigo'
      
        '   GROUP BY DATA, NUMERO_LEITURA, VALOR, KWH, NUMERO_LEITURA_ANT' +
        'ERIOR,'
      '    C.cpfl_codigo, C.cpfl_lugar, CODIGO_CPFL, C.CPFL_CODIGO')
    Left = 360
    Top = 208
    object dtmfldPesquisaDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'LEITURA_CPFL.DATA'
    end
    object qryPesquisaNUMERO_LEITURA: TIntegerField
      FieldName = 'NUMERO_LEITURA'
      Origin = 'LEITURA_CPFL.NUMERO_LEITURA'
    end
    object ibcdfldPesquisaVALOR: TIBBCDField
      FieldName = 'VALOR'
      Origin = 'LEITURA_CPFL.VALOR'
      DisplayFormat = 'R$###,##0.00'
      Precision = 18
      Size = 2
    end
    object qryPesquisaKWH: TIntegerField
      FieldName = 'KWH'
      Origin = 'LEITURA_CPFL.KWH'
    end
    object qryPesquisaNUMERO_LEITURA_ANTERIOR: TIntegerField
      FieldName = 'NUMERO_LEITURA_ANTERIOR'
      Origin = 'LEITURA_CPFL.NUMERO_LEITURA_ANTERIOR'
    end
    object ibstrngfldPesquisaLUGAR: TIBStringField
      FieldName = 'LUGAR'
      Size = 114
    end
    object qryPesquisaKWHX10: TLargeintField
      FieldName = 'KWHX10'
    end
    object qryPesquisaCODIGO_CPFL: TIntegerField
      FieldName = 'CODIGO_CPFL'
      Origin = 'LEITURA_CPFL.CODIGO_CPFL'
      Required = True
    end
    object qryPesquisaCPFL_CODIGO: TIntegerField
      FieldName = 'CPFL_CODIGO'
      Origin = 'CAD_LUGAR_LEITURA_CPFL.CPFL_CODIGO'
      Required = True
    end
  end
  object dtsPesquisa: TDataSource
    DataSet = qryPesquisa
    Left = 312
    Top = 208
  end
end
