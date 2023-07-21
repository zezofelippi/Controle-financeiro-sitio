object frm_menu: Tfrm_menu
  Left = 360
  Top = 190
  Width = 632
  Height = 385
  Caption = 'Menu'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 248
    Top = 184
    object menDespesas: TMenuItem
      Caption = 'Despesas'
      object menCadDespesas: TMenuItem
        Caption = 'Cad. Despesas'
        OnClick = menCadDespesasClick
      end
      object ipoDespesa1: TMenuItem
        Caption = 'Cad. Tipo Despesa'
        OnClick = ipoDespesa1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object menRelGeral: TMenuItem
        Caption = 'Rel. Geral'
        OnClick = menRelGeralClick
      end
    end
    object menReceita: TMenuItem
      Caption = 'Receita'
      object menCadReceita: TMenuItem
        Caption = 'Cad. Receita'
        OnClick = menCadReceitaClick
      end
      object menCadTipoReceita: TMenuItem
        Caption = 'Cad. Tipo Receita'
        OnClick = menCadTipoReceitaClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
    end
    object menRelatorioGeral: TMenuItem
      Caption = 'Relatorio Geral'
      object menReceitasXDespesas: TMenuItem
        Caption = 'Receitas X Despesas'
        OnClick = menReceitasXDespesasClick
      end
    end
    object menDiversos: TMenuItem
      Caption = 'Diversos'
      object menMovimentaoMaquina: TMenuItem
        Caption = 'Movimenta'#231#227'o Maquina'
        OnClick = menMovimentaoMaquinaClick
      end
      object menLeituraCPFL: TMenuItem
        Caption = 'Leitura CPFL'
        OnClick = menLeituraCPFLClick
      end
    end
    object menObs: TMenuItem
      Caption = 'Obs'
      object menDescricaoOBS: TMenuItem
        Caption = 'OBS'
        OnClick = menDescricaoOBSClick
      end
    end
    object N3: TMenuItem
      Caption = '|||||'
    end
  end
end
