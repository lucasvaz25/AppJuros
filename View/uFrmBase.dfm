object FrmBase: TFrmBase
  Left = 0
  Top = 0
  Caption = 'frmBase'
  ClientHeight = 264
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnSair: TBitBtn
    Left = 356
    Top = 231
    Width = 75
    Height = 25
    Align = alCustom
    Anchors = [akRight, akBottom]
    Caption = 'Sai&r'
    TabOrder = 0
  end
  object btnSalvar: TBitBtn
    Left = 216
    Top = 231
    Width = 75
    Height = 25
    Caption = 'S&alvar'
    TabOrder = 1
  end
end
