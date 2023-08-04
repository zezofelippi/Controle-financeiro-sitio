object frmListDespRec: TfrmListDespRec
  Left = 575
  Top = 192
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Receita X Despesa'
  ClientHeight = 284
  ClientWidth = 337
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
    Left = 8
    Top = 70
    Width = 42
    Height = 13
    Caption = 'Despesa'
  end
  object Label4: TLabel
    Left = 7
    Top = 117
    Width = 37
    Height = 13
    Caption = 'Receita'
  end
  object txt_data_i: TDateEdit
    Left = 6
    Top = 39
    Width = 104
    Height = 21
    NumGlyphs = 2
    TabOrder = 0
    OnEnter = txt_data_iEnter
    OnExit = txt_data_iExit
  end
  object txt_data_f: TDateEdit
    Left = 117
    Top = 39
    Width = 101
    Height = 21
    NumGlyphs = 2
    TabOrder = 1
    OnEnter = txt_data_fEnter
    OnExit = txt_data_fExit
  end
  object Button1: TButton
    Left = 100
    Top = 247
    Width = 137
    Height = 31
    Caption = 'Visualizar Dados'
    TabOrder = 2
    OnClick = Button1Click
  end
  object rdg_agrupado: TRadioGroup
    Left = 8
    Top = 181
    Width = 233
    Height = 49
    Caption = 'Agrupado por :'
    Columns = 2
    Items.Strings = (
      'Por Mes'
      'Por Ano')
    TabOrder = 3
  end
  object cboDespesa: TDBLookupComboBox
    Left = 6
    Top = 87
    Width = 328
    Height = 21
    KeyField = 'TIP_CODIGO_SIT'
    ListField = 'DESPESA'
    ListSource = dsDespesa
    TabOrder = 4
    OnEnter = cboDespesaEnter
    OnExit = cboDespesaExit
    OnKeyDown = cboDespesaKeyDown
  end
  object cboReceita: TDBLookupComboBox
    Left = 6
    Top = 134
    Width = 328
    Height = 21
    KeyField = 'CODIGO'
    ListField = 'REC'
    ListSource = dsReceita
    TabOrder = 5
    OnEnter = cboReceitaEnter
    OnExit = cboReceitaExit
    OnKeyDown = cboReceitaKeyDown
  end
  object qryDespesa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT TIP_CODIGO_SIT, TIP_DESCRICAO_SIT, TIP_CODIGO_SIT ||'#39' - '#39 +
        '|| TIP_DESCRICAO_SIT AS DESPESA FROM TIPO_DESPESA_SITIO')
    Left = 248
    Top = 64
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
  object qryReceita: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT CODIGO, CODIGO ||'#39' - '#39'|| RECEITA AS REC '
      '     FROM TIPO_RECEITA_SITIO ORDER BY CODIGO')
    Left = 240
    Top = 120
    object qryReceitaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'TIPO_RECEITA_SITIO.CODIGO'
      Required = True
    end
    object qryReceitaREC: TIBStringField
      FieldName = 'REC'
      Size = 78
    end
  end
  object dsDespesa: TDataSource
    DataSet = qryDespesa
    Left = 216
    Top = 64
  end
  object dsReceita: TDataSource
    DataSet = qryReceita
    Left = 200
    Top = 120
  end
end
