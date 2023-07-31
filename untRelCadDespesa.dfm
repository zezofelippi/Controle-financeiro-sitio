object frmRelCadDespesa: TfrmRelCadDespesa
  Left = 254
  Top = 163
  Width = 906
  Height = 512
  VertScrollBar.Position = 14
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
    Left = 24
    Top = 16
    Width = 794
    Height = 1123
    DataSource = ds_pesquisar
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 45
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLLabel1: TRLLabel
        Left = 319
        Top = 12
        Width = 80
        Height = 19
        Align = faCenter
        Alignment = taCenter
        Caption = 'Despesas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_data: TRLLabel
        Left = 8
        Top = 24
        Width = 49
        Height = 16
      end
    end
    object RLBand6: TRLBand
      Left = 38
      Top = 287
      Width = 718
      Height = 80
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLLabel4: TRLLabel
        Left = 522
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
        Left = 623
        Top = 7
        Width = 88
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'VALOR'
        DataSource = ds_pesquisar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Info = riSum
        ParentFont = False
      end
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 83
      Width = 718
      Height = 204
      DataFields = 'MES'
      object RLGroup4: TRLGroup
        Left = 0
        Top = 0
        Width = 718
        Height = 136
        DataFields = 'ANO'
        object RLBand5: TRLBand
          Left = 0
          Top = 59
          Width = 718
          Height = 30
          BandType = btColumnFooter
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = True
          Borders.DrawRight = False
          Borders.DrawBottom = False
          object RLLabel2: TRLLabel
            Left = 525
            Top = 7
            Width = 87
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Total:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLDBResult1: TRLDBResult
            Left = 624
            Top = 7
            Width = 88
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'VALOR'
            DataSource = ds_pesquisar
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
          Left = 0
          Top = 17
          Width = 718
          Height = 24
          BandType = btColumnHeader
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = True
          object RLLabel5: TRLLabel
            Left = 635
            Top = 7
            Width = 79
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
          object RLLabel7: TRLLabel
            Left = 75
            Top = 7
            Width = 56
            Height = 16
            Alignment = taCenter
            AutoSize = False
            Caption = 'Codigo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel3: TRLLabel
            Left = 4
            Top = 8
            Width = 68
            Height = 16
            Alignment = taCenter
            AutoSize = False
            Caption = 'Data'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel6: TRLLabel
            Left = 132
            Top = 8
            Width = 134
            Height = 16
            AutoSize = False
            Caption = 'Despesa'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel8: TRLLabel
            Left = 269
            Top = 8
            Width = 271
            Height = 16
            AutoSize = False
            Caption = 'Descri'#231#227'o da Despesa'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object RLBand3: TRLBand
          Left = 0
          Top = 41
          Width = 718
          Height = 18
          BeforePrint = RLBand3BeforePrint
          object RLDBText3: TRLDBText
            Left = 268
            Top = 2
            Width = 363
            Height = 14
            AutoSize = False
            DataField = 'DESPESA_OUTROS'
            DataSource = ds_pesquisar
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText4: TRLDBText
            Left = 636
            Top = 2
            Width = 77
            Height = 15
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'VALOR'
            DataSource = ds_pesquisar
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText1: TRLDBText
            Left = 3
            Top = 2
            Width = 68
            Height = 13
            Alignment = taCenter
            AutoSize = False
            DataField = 'DATA'
            DataSource = ds_pesquisar
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText2: TRLDBText
            Left = 74
            Top = 3
            Width = 58
            Height = 13
            Alignment = taCenter
            AutoSize = False
            DataField = 'CODIGO'
            DataSource = ds_pesquisar
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText5: TRLDBText
            Left = 133
            Top = 2
            Width = 133
            Height = 14
            AutoSize = False
            DataField = 'DESCR'
            DataSource = ds_pesquisar
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
        end
        object RLBand2: TRLBand
          Left = 0
          Top = 0
          Width = 718
          Height = 17
          BandType = btTitle
          Color = clMenuBar
          ParentColor = False
          Transparent = False
          BeforePrint = RLBand2BeforePrint
          object lblMes_ano: TRLLabel
            Left = 4
            Top = 1
            Width = 233
            Height = 15
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
        end
      end
    end
  end
  object frRelatorioAno: TRLReport
    Left = 815
    Top = 353
    Width = 794
    Height = 1123
    DataSource = dsPesquisaAno
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand7: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 51
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = False
      object RLLabel10: TRLLabel
        Left = 319
        Top = 16
        Width = 80
        Height = 19
        Align = faCenter
        Alignment = taCenter
        Caption = 'Despesas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_data_ano: TRLLabel
        Left = 8
        Top = 29
        Width = 77
        Height = 16
      end
    end
    object RLGroup2: TRLGroup
      Left = 38
      Top = 89
      Width = 718
      Height = 116
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = False
      Borders.DrawRight = True
      Borders.DrawBottom = False
      DataFields = 'ANO'
      object RLBand11: TRLBand
        Left = 1
        Top = 62
        Width = 716
        Height = 31
        BandType = btSummary
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object RLLabel9: TRLLabel
          Left = 525
          Top = 7
          Width = 87
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBResult3: TRLDBResult
          Left = 624
          Top = 7
          Width = 88
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VALOR'
          DataSource = dsPesquisaAno
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Info = riSum
          ParentFont = False
        end
      end
      object RLBand10: TRLBand
        Left = 1
        Top = 44
        Width = 716
        Height = 18
        BeforePrint = RLBand10BeforePrint
        object RLDBText6: TRLDBText
          Left = 3
          Top = 2
          Width = 68
          Height = 13
          Alignment = taCenter
          AutoSize = False
          DataField = 'DATA'
          DataSource = dsPesquisaAno
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText8: TRLDBText
          Left = 76
          Top = 2
          Width = 162
          Height = 14
          AutoSize = False
          DataField = 'DESCR'
          DataSource = dsPesquisaAno
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText9: TRLDBText
          Left = 245
          Top = 2
          Width = 385
          Height = 14
          AutoSize = False
          DataField = 'DESPESA_OUTROS'
          DataSource = dsPesquisaAno
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText10: TRLDBText
          Left = 636
          Top = 2
          Width = 77
          Height = 15
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VALOR'
          DataSource = dsPesquisaAno
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
      object RLBand9: TRLBand
        Left = 1
        Top = 18
        Width = 716
        Height = 26
        BandType = btColumnHeader
        object RLLabel13: TRLLabel
          Left = 4
          Top = 8
          Width = 68
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel15: TRLLabel
          Left = 75
          Top = 8
          Width = 163
          Height = 16
          AutoSize = False
          Caption = 'Despesa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel16: TRLLabel
          Left = 244
          Top = 8
          Width = 271
          Height = 16
          AutoSize = False
          Caption = 'Descri'#231#227'o da Despesa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel17: TRLLabel
          Left = 635
          Top = 8
          Width = 79
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
      object RLBand8: TRLBand
        Left = 1
        Top = 0
        Width = 716
        Height = 18
        BandType = btTitle
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Color = clMenuBar
        ParentColor = False
        Transparent = False
        BeforePrint = RLBand8BeforePrint
        object lbl_ano: TRLLabel
          Left = 55
          Top = 1
          Width = 233
          Height = 15
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel12: TRLLabel
          Left = 4
          Top = 2
          Width = 46
          Height = 15
          AutoSize = False
          Caption = 'Ano :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
      end
    end
    object RLBand12: TRLBand
      Left = 38
      Top = 205
      Width = 718
      Height = 33
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      object RLLabel11: TRLLabel
        Left = 522
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
      object RLDBResult4: TRLDBResult
        Left = 623
        Top = 7
        Width = 88
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'VALOR'
        DataSource = dsPesquisaAno
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
      
        'SELECT EXTRACT(month FROM CA.DATA) AS MES, EXTRACT(YEAR FROM CA.' +
        'DATA) AS ANO,'
      
        'TD.TIP_CODIGO_SIT ||'#39' - '#39'|| TD.TIP_DESCRICAO_SIT AS DESCR, CA.CO' +
        'DIGO,'
      'CA.DATA, CA.VALOR, CA.SEMANA, CA.DESPESA_OUTROS'
      
        'FROM CAD_DESPESA_SITIO CA, TIPO_DESPESA_SITIO TD where TD.TIP_CO' +
        'DIGO_SIT = CA.TIP_CODIGO_SIT'
      'GROUP BY EXTRACT(MONTH FROM CA.DATA),'
      
        'EXTRACT(YEAR FROM CA.DATA), CA.DATA, CA.VALOR, CA.SEMANA, CA.DES' +
        'PESA_OUTROS, TD.tip_descricao_SIT, TD.tip_codigo_SIT, CA.CODIGO')
    Left = 416
    Top = 8
    object qry_pesquisaMES: TSmallintField
      FieldName = 'MES'
    end
    object qry_pesquisaDESCR: TIBStringField
      FieldName = 'DESCR'
      Size = 78
    end
    object qry_pesquisaDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'CAD_DESPESA.DATA'
    end
    object qry_pesquisaVALOR: TIBBCDField
      FieldName = 'VALOR'
      Origin = 'CAD_DESPESA.VALOR'
      DisplayFormat = '###,##0.00'
      Precision = 18
      Size = 2
    end
    object qry_pesquisaSEMANA: TIBStringField
      FieldName = 'SEMANA'
      Origin = 'CAD_DESPESA.SEMANA'
      Size = 15
    end
    object qry_pesquisaDESPESA_OUTROS: TIBStringField
      FieldName = 'DESPESA_OUTROS'
      Origin = 'CAD_DESPESA.DESPESA_OUTROS'
      Size = 150
    end
    object qry_pesquisaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CAD_DESPESA.CODIGO'
      Required = True
    end
    object qry_pesquisaANO: TSmallintField
      FieldName = 'ANO'
    end
  end
  object ds_pesquisar: TDataSource
    DataSet = qry_pesquisa
    Left = 360
    Top = 8
  end
  object qryPesquisaAno: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT EXTRACT(YEAR FROM CA.DATA) AS ANO,'
      
        'TD.TIP_CODIGO_SIT ||'#39' - '#39'|| TD.TIP_DESCRICAO_SIT AS DESCR, CA.CO' +
        'DIGO,'
      'CA.DATA, CA.VALOR, CA.SEMANA, CA.DESPESA_OUTROS'
      
        'FROM CAD_DESPESA_SITIO CA, TIPO_DESPESA_SITIO TD where TD.TIP_CO' +
        'DIGO_SIT = CA.TIP_CODIGO_SIT'
      'GROUP BY '
      
        'EXTRACT(YEAR FROM CA.DATA), CA.DATA, CA.VALOR, CA.SEMANA, CA.DES' +
        'PESA_OUTROS, TD.tip_descricao_SIT, TD.tip_codigo_SIT, CA.CODIGO')
    Left = 592
    Top = 5
    object qryPesquisaAnoANO: TSmallintField
      FieldName = 'ANO'
    end
    object qryPesquisaAnoDESCR: TIBStringField
      FieldName = 'DESCR'
      Size = 78
    end
    object qryPesquisaAnoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CAD_DESPESA_SITIO.CODIGO'
      Required = True
    end
    object qryPesquisaAnoDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'CAD_DESPESA_SITIO.DATA'
    end
    object qryPesquisaAnoVALOR: TIBBCDField
      FieldName = 'VALOR'
      Origin = 'CAD_DESPESA_SITIO.VALOR'
      DisplayFormat = '###,##0.00'
      Precision = 18
      Size = 2
    end
    object qryPesquisaAnoSEMANA: TIBStringField
      FieldName = 'SEMANA'
      Origin = 'CAD_DESPESA_SITIO.SEMANA'
      Size = 15
    end
    object qryPesquisaAnoDESPESA_OUTROS: TIBStringField
      FieldName = 'DESPESA_OUTROS'
      Origin = 'CAD_DESPESA_SITIO.DESPESA_OUTROS'
      Size = 150
    end
  end
  object dsPesquisaAno: TDataSource
    DataSet = qryPesquisaAno
    Left = 558
    Top = 5
  end
end
