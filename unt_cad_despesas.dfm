object frm_cad_despesas: Tfrm_cad_despesas
  Left = 501
  Top = 243
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Despesa'
  ClientHeight = 178
  ClientWidth = 407
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 11
    Top = 16
    Width = 42
    Height = 13
    Caption = 'Despesa'
  end
  object Label2: TLabel
    Left = 8
    Top = 72
    Width = 108
    Height = 13
    Caption = 'Descri'#231#227'o da Despesa'
  end
  object Label3: TLabel
    Left = 8
    Top = 120
    Width = 24
    Height = 13
    Caption = 'Valor'
  end
  object Label4: TLabel
    Left = 115
    Top = 121
    Width = 23
    Height = 13
    Caption = 'Data'
  end
  object txt_outra_despesa: TEdit
    Left = 8
    Top = 90
    Width = 393
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 150
    TabOrder = 0
    OnEnter = txt_outra_despesaEnter
    OnExit = txt_outra_despesaExit
    OnKeyPress = txt_outra_despesaKeyPress
  end
  object btnGravar: TButton
    Left = 214
    Top = 135
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 1
    OnClick = btnGravarClick
  end
  object txt_Valor: TCurrencyEdit
    Left = 8
    Top = 138
    Width = 91
    Height = 21
    AutoSize = False
    TabOrder = 2
    OnEnter = txt_ValorEnter
    OnExit = txt_ValorExit
    OnKeyPress = txt_valorKeyPress
  end
  object txt_data: TDateEdit
    Left = 112
    Top = 138
    Width = 88
    Height = 21
    NumGlyphs = 2
    TabOrder = 3
    OnEnter = txt_dataEnter
    OnExit = txt_dataExit
    OnKeyPress = txt_dataKeyPress
  end
  object cboDespesa: TDBLookupComboBox
    Left = 9
    Top = 33
    Width = 392
    Height = 21
    KeyField = 'TIP_CODIGO_SIT'
    ListField = 'DESPESA'
    ListSource = dsDespesa
    TabOrder = 4
    OnEnter = cboDespesaEnter
    OnExit = cboDespesaExit
    OnKeyDown = cboDespesaKeyDown
    OnKeyPress = cboDespesaKeyPress
  end
  object qry_despesa: TIBQuery
    Database = dm.BD
    Transaction = IBTransLocal
    BufferChunks = 1000
    CachedUpdates = False
    Left = 296
    Top = 128
  end
  object IBTransLocal: TIBTransaction
    Active = False
    DefaultDatabase = dm.BD
    AutoStopAction = saNone
    Left = 336
    Top = 128
  end
  object QRY_MAX_CODIGO: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 376
    Top = 128
  end
  object qryDespesa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT TIP_CODIGO_SIT, TIP_DESCRICAO_SIT, TIP_CODIGO_SIT ||'#39' - '#39 +
        '|| TIP_DESCRICAO_SIT AS DESPESA FROM TIPO_DESPESA_SITIO')
    Left = 304
    Top = 56
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
    Left = 264
    Top = 56
  end
  object qry_pesquisa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 288
    Top = 8
  end
  object qry_pesquisa_ano: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 176
    Top = 8
  end
end
