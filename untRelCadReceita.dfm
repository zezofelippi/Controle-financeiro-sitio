object frmRelCadReceita: TfrmRelCadReceita
  Left = 229
  Top = 121
  Width = 870
  Height = 531
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object frRelatorio: TRLReport
    Left = 40
    Top = 28
    Width = 794
    Height = 1123
    DataSource = ds_pesquisa
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 33
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = False
      object RLLabel1: TRLLabel
        Left = 302
        Top = 7
        Width = 114
        Height = 19
        Align = faCenter
        Alignment = taCenter
        Caption = 'Recebimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 71
      Width = 718
      Height = 132
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = False
      Borders.DrawRight = True
      Borders.DrawBottom = False
      DataFields = 'REC_CODIGO'
      object RLBand2: TRLBand
        Left = 1
        Top = 0
        Width = 716
        Height = 41
        BandType = btTitle
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Color = clMenuBar
        ParentColor = False
        Transparent = False
        BeforePrint = RLBand2BeforePrint
        object lbl_safra: TRLLabel
          Left = 76
          Top = 5
          Width = 52
          Height = 16
          Transparent = False
        end
        object RLLabel3: TRLLabel
          Left = 0
          Top = 5
          Width = 73
          Height = 15
          Caption = 'Safra (Ano) :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel7: TRLLabel
          Left = 0
          Top = 21
          Width = 73
          Height = 15
          AutoSize = False
          Caption = 'OBS..............:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object lbl_obs: TRLLabel
          Left = 76
          Top = 21
          Width = 45
          Height = 16
          Transparent = False
        end
      end
      object RLBand3: TRLBand
        Left = 1
        Top = 65
        Width = 716
        Height = 18
        BeforePrint = RLBand3BeforePrint
        object RLDBText3: TRLDBText
          Left = 4
          Top = 1
          Width = 428
          Height = 14
          AutoSize = False
          DataField = 'DESCRICAO_ITEM'
          DataSource = ds_pesquisa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText4: TRLDBText
          Left = 481
          Top = 2
          Width = 88
          Height = 15
          Alignment = taCenter
          AutoSize = False
          DataField = 'DATA'
          DataSource = ds_pesquisa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText2: TRLDBText
          Left = 573
          Top = 3
          Width = 88
          Height = 15
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VALOR'
          DataSource = ds_pesquisa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
      object RLBand5: TRLBand
        Left = 1
        Top = 83
        Width = 716
        Height = 30
        BandType = btSummary
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object RLLabel2: TRLLabel
          Left = 484
          Top = 7
          Width = 87
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Total Safra:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBResult1: TRLDBResult
          Left = 575
          Top = 7
          Width = 86
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VALOR'
          DataSource = ds_pesquisa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Info = riSum
          ParentFont = False
        end
      end
      object RLBand4: TRLBand
        Left = 1
        Top = 41
        Width = 716
        Height = 24
        BandType = btTitle
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLLabel5: TRLLabel
          Left = 481
          Top = 5
          Width = 88
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'Data Receb.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel9: TRLLabel
          Left = 4
          Top = 5
          Width = 428
          Height = 16
          AutoSize = False
          Caption = 'Descri'#231#227'o do Recebimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel6: TRLLabel
          Left = 573
          Top = 5
          Width = 88
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Valor (R$)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object RLBand6: TRLBand
      Left = 38
      Top = 203
      Width = 718
      Height = 36
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      object RLLabel4: TRLLabel
        Left = 483
        Top = 7
        Width = 87
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBResult2: TRLDBResult
        Left = 575
        Top = 7
        Width = 86
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'VALOR'
        DataSource = ds_pesquisa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Info = riSum
        ParentFont = False
      end
    end
  end
  object qry_pesquisa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT  I.cod_item, T.codigo ||'#39' - '#39'|| T.receita AS DESCRICAO_IT' +
        'EM,'
      'I.data, I.valor, I.REC_CODIGO'
      'FROM ITENS_RECEITAS_SITIO I, TIPO_RECEITA_SITIO T'
      'WHERE I.CODIGO = T.CODIGO')
    Left = 192
    Top = 7
    object qry_pesquisaCOD_ITEM: TIntegerField
      FieldName = 'COD_ITEM'
      Origin = 'ITENS_RECEITAS_SITIO.COD_ITEM'
      Required = True
    end
    object qry_pesquisaDESCRICAO_ITEM: TIBStringField
      FieldName = 'DESCRICAO_ITEM'
      Size = 78
    end
    object qry_pesquisaDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'ITENS_RECEITAS_SITIO.DATA'
    end
    object qry_pesquisaVALOR: TIBBCDField
      FieldName = 'VALOR'
      Origin = 'ITENS_RECEITAS_SITIO.VALOR'
      DisplayFormat = '###,##0.00'
      Precision = 18
      Size = 2
    end
    object qry_pesquisaREC_CODIGO: TIntegerField
      FieldName = 'REC_CODIGO'
      Origin = 'ITENS_RECEITAS_SITIO.REC_CODIGO'
    end
  end
  object ds_pesquisa: TDataSource
    DataSet = qry_pesquisa
    Left = 160
    Top = 7
  end
  object qryPesqSafra: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 336
    Top = 8
  end
end
