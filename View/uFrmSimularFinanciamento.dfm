inherited FrmSimularFinanciamento: TFrmSimularFinanciamento
  Caption = 'Simular Financiamento'
  ClientHeight = 402
  ClientWidth = 599
  OnCreate = FormCreate
  ExplicitWidth = 615
  ExplicitHeight = 441
  PixelsPerInch = 96
  TextHeight = 13
  object btnLimpar: TBitBtn [0]
    Left = 513
    Top = 62
    Width = 75
    Height = 25
    Caption = '&Limpar'
    TabOrder = 4
    OnClick = btnLimparClick
  end
  object btnSimular: TBitBtn [1]
    Left = 423
    Top = 62
    Width = 75
    Height = 25
    Caption = '&Simular'
    TabOrder = 3
    OnClick = btnSimularClick
  end
  object DBGrid1: TDBGrid [2]
    Left = 8
    Top = 112
    Width = 580
    Height = 217
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object edMeses: TLabeledEdit [3]
    Left = 288
    Top = 64
    Width = 121
    Height = 21
    EditLabel.Width = 36
    EditLabel.Height = 13
    EditLabel.Caption = 'Meses*'
    NumbersOnly = True
    TabOrder = 2
  end
  object edTxJuros: TLabeledEdit [4]
    Left = 146
    Top = 64
    Width = 121
    Height = 21
    EditLabel.Width = 74
    EditLabel.Height = 13
    EditLabel.Caption = 'Taxa de Juros*'
    TabOrder = 1
    OnExit = edTxJurosExit
  end
  object edCapital: TLabeledEdit [5]
    Left = 8
    Top = 64
    Width = 121
    Height = 21
    BiDiMode = bdLeftToRight
    EditLabel.Width = 39
    EditLabel.Height = 13
    EditLabel.BiDiMode = bdLeftToRight
    EditLabel.Caption = 'Capital*'
    EditLabel.ParentBiDiMode = False
    ParentBiDiMode = False
    TabOrder = 0
    OnExit = edCapitalExit
  end
  inherited btnSair: TBitBtn
    Left = 500
    Top = 369
    TabOrder = 6
    OnClick = btnSairClick
    ExplicitLeft = 500
    ExplicitTop = 369
  end
  inherited btnSalvar: TBitBtn
    Left = 384
    Top = 369
    Enabled = False
    TabOrder = 7
    Visible = False
    ExplicitLeft = 384
    ExplicitTop = 369
  end
end
