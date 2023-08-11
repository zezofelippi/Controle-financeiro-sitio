object frmRelObs: TfrmRelObs
  Left = 260
  Top = 107
  Width = 870
  Height = 500
  Caption = 'frmRelObs'
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
    Left = 16
    Top = 16
    Width = 794
    Height = 1123
    DataSource = dsObs
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 43
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = False
      object RLLabel1: TRLLabel
        Left = 316
        Top = 14
        Width = 85
        Height = 16
        Align = faCenter
        Caption = 'Observa'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 81
      Width = 718
      Height = 22
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      Color = clMenuBar
      ParentColor = False
      Transparent = False
      object RLLabel2: TRLLabel
        Left = 8
        Top = 3
        Width = 85
        Height = 16
        Caption = 'Observa'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 103
      Width = 718
      Height = 23
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = False
      Borders.DrawRight = True
      Borders.DrawBottom = True
      BeforePrint = RLBand3BeforePrint
      object RLDBText1: TRLDBText
        Left = 8
        Top = 3
        Width = 697
        Height = 16
        AutoSize = False
        DataField = 'DESCRICAO'
        DataSource = dsObs
      end
    end
  end
  object qryObs: TIBQuery
    Database = dm.BD
    Transaction = dm.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from lembretes_sitio')
    Left = 328
    Top = 32
    object qryObsCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'LEMBRETES_SITIO.CODIGO'
      Required = True
    end
    object qryObsDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'LEMBRETES_SITIO.DESCRICAO'
      Size = 250
    end
  end
  object dsObs: TDataSource
    DataSet = qryObs
    Left = 286
    Top = 34
  end
end
