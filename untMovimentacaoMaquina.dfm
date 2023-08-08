object frmMovimentacaoMaquina: TfrmMovimentacaoMaquina
  Left = 199
  Top = 158
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Movimenta'#231#227'o Maquina'
  ClientHeight = 515
  ClientWidth = 940
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
  object gpb1: TGroupBox
    Left = 0
    Top = 0
    Width = 940
    Height = 81
    Align = alTop
    TabOrder = 0
    object lbl1: TLabel
      Left = 8
      Top = 24
      Width = 41
      Height = 13
      Caption = 'Maquina'
    end
    object lbl2: TLabel
      Left = 304
      Top = 24
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object lbl3: TLabel
      Left = 400
      Top = 24
      Width = 33
      Height = 13
      Caption = 'Tempo'
    end
    object lbl4: TLabel
      Left = 472
      Top = 24
      Width = 83
      Height = 13
      Caption = 'QTD Combustivel'
    end
    object lbl5: TLabel
      Left = 570
      Top = 24
      Width = 22
      Height = 13
      Caption = 'OBS'
    end
    object cboMaquina: TDBLookupComboBox
      Left = 8
      Top = 40
      Width = 289
      Height = 21
      KeyField = 'MAQ_CODIGO'
      ListField = 'MAQUINA'
      ListSource = dsMaquina
      TabOrder = 0
      OnKeyPress = cboMaquinaKeyPress
    end
    object edtTempo: TMaskEdit
      Left = 400
      Top = 40
      Width = 56
      Height = 21
      EditMask = '!90:00;1;_'
      MaxLength = 5
      TabOrder = 1
      Text = '  :  '
      OnKeyPress = edtTempoKeyPress
    end
    object edtQtdCombustivel: TRxCalcEdit
      Left = 472
      Top = 40
      Width = 90
      Height = 21
      AutoSize = False
      DecimalPlaces = 3
      DisplayFormat = ',0.000'
      NumGlyphs = 2
      TabOrder = 2
      OnKeyPress = edtQtdCombustivelKeyPress
    end
    object edtObs: TEdit
      Left = 568
      Top = 40
      Width = 290
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 3
      OnKeyPress = edtObsKeyPress
    end
    object btnGravar: TButton
      Left = 864
      Top = 37
      Width = 72
      Height = 25
      Caption = 'Gravar'
      TabOrder = 4
      OnClick = btnGravarClick
    end
    object edtData: TDateEdit
      Left = 304
      Top = 40
      Width = 91
      Height = 21
      NumGlyphs = 2
      TabOrder = 5
      OnKeyPress = edtDataKeyPress
    end
  end
  object gpb2: TGroupBox
    Left = 0
    Top = 81
    Width = 940
    Height = 97
    Align = alTop
    Caption = 'Pesquisa Registro'
    TabOrder = 1
    object lbl6: TLabel
      Left = 205
      Top = 16
      Width = 41
      Height = 13
      Caption = 'Maquina'
    end
    object lbl7: TLabel
      Left = 8
      Top = 17
      Width = 53
      Height = 13
      Caption = 'Data Inicial'
    end
    object lbl9: TLabel
      Left = 501
      Top = 14
      Width = 22
      Height = 13
      Caption = 'OBS'
    end
    object lbl8: TLabel
      Left = 101
      Top = 16
      Width = 48
      Height = 13
      Caption = 'Data Final'
    end
    object cboMaquinaPesq: TDBLookupComboBox
      Left = 205
      Top = 32
      Width = 288
      Height = 21
      KeyField = 'MAQ_CODIGO'
      ListField = 'MAQUINA'
      ListSource = dsMaquina
      TabOrder = 0
      OnKeyDown = cboMaquinaPesqKeyDown
    end
    object edtObsPesq: TEdit
      Left = 499
      Top = 31
      Width = 336
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object btnPesquisar: TButton
      Left = 851
      Top = 26
      Width = 72
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 2
      OnClick = btnPesquisarClick
    end
    object edtDataInicial: TDateEdit
      Left = 8
      Top = 32
      Width = 91
      Height = 21
      NumGlyphs = 2
      TabOrder = 3
    end
    object edtDataFinal: TDateEdit
      Left = 103
      Top = 31
      Width = 96
      Height = 21
      NumGlyphs = 2
      TabOrder = 4
    end
    object rdb_inicio: TRadioButton
      Left = 571
      Top = 56
      Width = 57
      Height = 17
      Caption = 'Inicio'
      TabOrder = 5
    end
    object rdb_posicao: TRadioButton
      Left = 659
      Top = 56
      Width = 113
      Height = 17
      Caption = 'Qualquer posicao'
      TabOrder = 6
    end
    object chkManutencao: TCheckBox
      Left = 224
      Top = 72
      Width = 217
      Height = 17
      Caption = 'Pesquisar somente manuten'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
    end
  end
  object gpb3: TGroupBox
    Left = 0
    Top = 439
    Width = 940
    Height = 76
    Align = alBottom
    TabOrder = 2
    object lbl10: TLabel
      Left = 356
      Top = 16
      Width = 136
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = 'Total Tempo'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl11: TLabel
      Left = 508
      Top = 15
      Width = 136
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = 'Total Combustivel'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object edtTotalQtdCombustivel: TRxCalcEdit
      Left = 508
      Top = 33
      Width = 136
      Height = 21
      AutoSize = False
      DisplayFormat = '###,##0.000'
      NumGlyphs = 2
      ReadOnly = True
      TabOrder = 0
    end
    object edtTotalTempo: TEdit
      Left = 356
      Top = 34
      Width = 136
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
  end
  object grd1: TDBGrid
    Left = 0
    Top = 178
    Width = 940
    Height = 261
    Align = alClient
    DataSource = dsPesquisa
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = grd1DrawColumnCell
    OnTitleClick = grd1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'MAQUINA'
        Title.Caption = 'Maquina'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 300
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MOV_DATA'
        Title.Alignment = taCenter
        Title.Caption = 'Data'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 90
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MOV_TEMPO'
        Title.Alignment = taCenter
        Title.Caption = 'Tempo'
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
        FieldName = 'MOV_QTD_COMBUSTIVEL'
        Title.Alignment = taRightJustify
        Title.Caption = 'Qtd Combustivel'
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
        FieldName = 'MOV_OBS'
        Title.Caption = 'Obs'
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
  object qry_movimento: TIBQuery
    Database = dm.BD
    Transaction = IBTRANSLOCAL
    BufferChunks = 1000
    CachedUpdates = False
    Left = 728
    Top = 16
  end
  object IBTRANSLOCAL: TIBTransaction
    Active = False
    DefaultDatabase = dm.BD
    AutoStopAction = saNone
    Left = 648
    Top = 16
  end
  object qryPesquisa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT MAQ.maq_codigo || '#39' - '#39' || MAQ.maq_descricao AS MAQUINA,'
      
        '  mov.mov_data, MOV.mov_tempo, MOV.mov_qtd_combustivel, MOV.mov_' +
        'obs, MOV.MOV_MANUTENCAO'
      '  FROM cad_maquina MAQ'
      '    INNER JOIN movimentacao_maquina MOV ON'
      '    MAQ.maq_codigo = MOV.maq_codigo')
    Left = 776
    Top = 208
    object ibstrngfldPesquisaMAQUINA: TIBStringField
      FieldName = 'MAQUINA'
      Size = 114
    end
    object dtmfldPesquisaMOV_DATA: TDateTimeField
      FieldName = 'MOV_DATA'
      Origin = 'MOVIMENTACAO_MAQUINA.MOV_DATA'
    end
    object tmfldPesquisaMOV_TEMPO: TTimeField
      FieldName = 'MOV_TEMPO'
      Origin = 'MOVIMENTACAO_MAQUINA.MOV_TEMPO'
    end
    object ibcdfldPesquisaMOV_QTD_COMBUSTIVEL: TIBBCDField
      FieldName = 'MOV_QTD_COMBUSTIVEL'
      Origin = 'MOVIMENTACAO_MAQUINA.MOV_QTD_COMBUSTIVEL'
      DisplayFormat = '###,##0.000'
      Precision = 18
      Size = 3
    end
    object ibstrngfldPesquisaMOV_OBS: TIBStringField
      FieldName = 'MOV_OBS'
      Origin = 'MOVIMENTACAO_MAQUINA.MOV_OBS'
      Size = 200
    end
    object ibstrngfldPesquisaMOV_MANUTENCAO: TIBStringField
      FieldName = 'MOV_MANUTENCAO'
      Origin = 'MOVIMENTACAO_MAQUINA.MOV_MANUTENCAO'
      FixedChar = True
      Size = 1
    end
  end
  object dsPesquisa: TDataSource
    DataSet = qryPesquisa
    Left = 720
    Top = 216
  end
  object dsMaquina: TDataSource
    DataSet = qryMaquina
    Left = 160
    Top = 24
  end
  object qryMaquina: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT MAQ_CODIGO ||'#39' - '#39'|| MAQ_DESCRICAO AS MAQUINA, MAQ_CODIGO'
      'FROM CAD_MAQUINA')
    Left = 208
    Top = 24
    object ibstrngfldMaquinaMAQUINA: TIBStringField
      FieldName = 'MAQUINA'
      Size = 114
    end
    object qryMaquinaMAQ_CODIGO: TIntegerField
      FieldName = 'MAQ_CODIGO'
      Origin = 'CAD_MAQUINA.MAQ_CODIGO'
      Required = True
    end
  end
  object qryTotal: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 736
    Top = 437
  end
end
