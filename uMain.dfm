object frmMain: TfrmMain
  Left = 266
  Top = 131
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'frmMain'
  ClientHeight = 160
  ClientWidth = 196
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Status: TStatusBar
    Left = 0
    Top = 144
    Width = 196
    Height = 16
    Panels = <
      item
        Text = 'Score'
        Width = 50
      end
      item
        Alignment = taRightJustify
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Width = 50
      end
      item
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Text = 'Vidas'
        Width = 50
      end
      item
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Width = 50
      end>
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 30
    OnTimer = Timer1Timer
    Left = 128
    Top = 112
  end
end
