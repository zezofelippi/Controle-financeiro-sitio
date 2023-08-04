object frmRelRecDesp: TfrmRelRecDesp
  Left = 293
  Top = 97
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Relatorio de Receitas & Despesas'
  ClientHeight = 573
  ClientWidth = 894
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object frRelatorio: TRLReport
    Left = 8
    Top = 8
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
      Height = 64
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      object RLLabel5: TRLLabel
        Left = 252
        Top = 1
        Width = 209
        Height = 19
        Align = faTopOnly
        Caption = 'Recebimentos X Despesas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_data: TRLLabel
        Left = 7
        Top = 22
        Width = 49
        Height = 16
      end
      object lbl_receita_despesa: TRLLabel
        Left = 8
        Top = 42
        Width = 119
        Height = 16
      end
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 102
      Width = 718
      Height = 98
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = False
      Borders.DrawRight = True
      Borders.DrawBottom = False
      DataFields = 'ANO'
      object RLBand4: TRLBand
        Left = 1
        Top = 56
        Width = 716
        Height = 31
        BandType = btSummary
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        BeforePrint = RLBand4BeforePrint
        object txt_receita_mes_glo: TRLDBResult
          Left = 120
          Top = 5
          Width = 106
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataSource = ds_pesquisa
        end
        object txt_despesa_mes_glo: TRLDBResult
          Left = 231
          Top = 4
          Width = 110
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataSource = ds_pesquisa
        end
        object txt_saldo_mes_glo: TRLDBResult
          Left = 345
          Top = 4
          Width = 106
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataSource = ds_pesquisa
          DisplayMask = '###,##0.00'
        end
        object RLLabel8: TRLLabel
          Left = 4
          Top = 5
          Width = 111
          Height = 16
          AutoSize = False
          Caption = 'Total.................:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand3: TRLBand
        Left = 1
        Top = 36
        Width = 716
        Height = 20
        BeforePrint = RLBand3BeforePrint
        object lblMes_ano: TRLDBText
          Left = 4
          Top = 2
          Width = 111
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object txt_receita_mes: TRLDBText
          Left = 119
          Top = 2
          Width = 106
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataSource = ds_pesquisa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object txt_despesa_mes: TRLDBText
          Left = 230
          Top = 2
          Width = 112
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataSource = ds_pesquisa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object txt_saldo_mes: TRLDBText
          Left = 345
          Top = 2
          Width = 106
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataSource = ds_pesquisa
          DisplayMask = '###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
      object RLBand2: TRLBand
        Left = 1
        Top = 18
        Width = 716
        Height = 18
        BandType = btColumnHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLLabel1: TRLLabel
          Left = 4
          Top = 0
          Width = 112
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel2: TRLLabel
          Left = 119
          Top = 0
          Width = 106
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'Recebimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel3: TRLLabel
          Left = 229
          Top = 0
          Width = 112
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'Despesa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel4: TRLLabel
          Left = 344
          Top = 0
          Width = 106
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'Saldo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand9: TRLBand
        Left = 1
        Top = 0
        Width = 716
        Height = 18
        BandType = btTitle
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Color = clMenuBar
        ParentColor = False
        Transparent = False
        object RLLabel7: TRLLabel
          Left = 4
          Top = 1
          Width = 45
          Height = 16
          AutoSize = False
          Caption = 'Ano:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLDBText1: TRLDBText
          Left = 52
          Top = 1
          Width = 32
          Height = 16
          DataField = 'ANO'
          DataSource = ds_pesquisa
          Transparent = False
        end
      end
    end
    object RLBand10: TRLBand
      Left = 38
      Top = 200
      Width = 718
      Height = 36
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      BeforePrint = RLBand10BeforePrint
      object RLLabel13: TRLLabel
        Left = 4
        Top = 5
        Width = 111
        Height = 16
        AutoSize = False
        Caption = 'Total Geral.......:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object txt_receita_mes_glo_geral: TRLDBResult
        Left = 120
        Top = 5
        Width = 106
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataSource = ds_pesquisa
      end
      object txt_despesa_mes_glo_geral: TRLDBResult
        Left = 231
        Top = 4
        Width = 110
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataSource = ds_pesquisa
      end
      object txt_saldo_mes_glo_geral: TRLDBResult
        Left = 345
        Top = 4
        Width = 106
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataSource = ds_pesquisa
        DisplayMask = '###,##0.00'
      end
    end
  end
  object frRelatorioAno: TRLReport
    Left = 40
    Top = 312
    Width = 794
    Height = 1123
    DataSource = ds_pesquisa_ano
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand5: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 64
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      object RLLabel6: TRLLabel
        Left = 252
        Top = 1
        Width = 209
        Height = 19
        Align = faTopOnly
        Caption = 'Recebimentos X Despesas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_data_ano: TRLLabel
        Left = 7
        Top = 22
        Width = 77
        Height = 16
      end
      object lbl_receita_despesa_ano: TRLLabel
        Left = 8
        Top = 42
        Width = 147
        Height = 16
      end
    end
    object RLBand8: TRLBand
      Left = 38
      Top = 102
      Width = 718
      Height = 18
      BandType = btColumnHeader
      object RLLabel9: TRLLabel
        Left = 4
        Top = 0
        Width = 111
        Height = 16
        AutoSize = False
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel10: TRLLabel
        Left = 119
        Top = 0
        Width = 106
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = 'Recebimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel11: TRLLabel
        Left = 229
        Top = 0
        Width = 112
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = 'Despesa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel12: TRLLabel
        Left = 344
        Top = 0
        Width = 106
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand7: TRLBand
      Left = 38
      Top = 120
      Width = 718
      Height = 20
      BeforePrint = RLBand7BeforePrint
      object lblAno: TRLDBText
        Left = 4
        Top = 2
        Width = 111
        Height = 16
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object txt_receita: TRLDBText
        Left = 119
        Top = 2
        Width = 106
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataSource = ds_pesquisa_ano
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object txt_despesa: TRLDBText
        Left = 230
        Top = 2
        Width = 112
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataSource = ds_pesquisa_ano
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object txt_saldo_ano: TRLDBText
        Left = 345
        Top = 2
        Width = 106
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataSource = ds_pesquisa_ano
        DisplayMask = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLBand6: TRLBand
      Left = 38
      Top = 140
      Width = 718
      Height = 77
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      BeforePrint = RLBand6BeforePrint
      object txt_receita_glo: TRLDBResult
        Left = 120
        Top = 5
        Width = 106
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataSource = ds_pesquisa_ano
      end
      object txt_despesa_glo: TRLDBResult
        Left = 231
        Top = 4
        Width = 110
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataSource = ds_pesquisa_ano
      end
      object txt_saldo_ano_glo: TRLDBResult
        Left = 345
        Top = 4
        Width = 106
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataSource = ds_pesquisa_ano
        DisplayMask = '###,##0.00'
      end
    end
  end
  object ds_pesquisa: TDataSource
    DataSet = qry_pesquisa
    Left = 240
    Top = 16
  end
  object qry_pesquisa: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT EXTRACT(YEAR FROM DATA) AS ANO, EXTRACT(MONTH FROM DATA) ' +
        'AS MES, tip_codigo_sit'
      '              FROM CAD_DESPESA_SITIO'
      '              WHERE  DATA BETWEEN :DATA1 AND :DATA2'
      
        '              group by EXTRACT(YEAR FROM DATA), EXTRACT(MONTH FR' +
        'OM DATA), tip_codigo_sit'
      ''
      'union'
      ''
      
        'SELECT EXTRACT(YEAR FROM DATA) AS ANO, EXTRACT(MONTH FROM DATA) ' +
        'AS MES, codigo'
      '              FROM ITENS_RECEITAS_SITIO'
      '              WHERE  DATA BETWEEN :DATA1 AND :DATA2'
      
        '              group by EXTRACT(YEAR FROM DATA), EXTRACT(MONTH FR' +
        'OM DATA), codigo')
    Left = 280
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DATA1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA2'
        ParamType = ptUnknown
      end>
    object qry_pesquisaANO: TSmallintField
      FieldName = 'ANO'
    end
    object qry_pesquisaMES: TSmallintField
      FieldName = 'MES'
    end
  end
  object qry_pesquisa_ano: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT EXTRACT(YEAR FROM DATA) AS ANO, tip_codigo_sit'
      '              FROM CAD_DESPESA_SITIO'
      '              WHERE  DATA BETWEEN :DATA1 AND :DATA2'
      
        '              group by EXTRACT(YEAR FROM DATA), COD_ANO, tip_cod' +
        'igo_sit'
      ''
      'union'
      ''
      'SELECT EXTRACT(YEAR FROM DATA) AS ANO, codigo'
      '              FROM ITENS_RECEITAS_SITIO'
      '              WHERE  DATA BETWEEN :DATA1 AND :DATA2'
      '              group by EXTRACT(YEAR FROM DATA), codigo'
      '')
    Left = 286
    Top = 62
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DATA1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA2'
        ParamType = ptUnknown
      end>
    object qry_pesquisa_anoANO: TSmallintField
      FieldName = 'ANO'
    end
  end
  object ds_pesquisa_ano: TDataSource
    DataSet = qry_pesquisa_ano
    Left = 238
    Top = 62
  end
  object qry_pesquisa_rec_desp: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 558
    Top = 70
  end
end
