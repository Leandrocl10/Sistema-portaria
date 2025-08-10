object FormMoradores: TFormMoradores
  Left = 0
  Top = 0
  Caption = 'Moradores'
  ClientHeight = 452
  ClientWidth = 847
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblNome: TLabel
    Left = 313
    Top = 40
    Width = 258
    Height = 33
    Caption = 'Lista de Moradores'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pnlPainelInferior: TPanel
    Left = 0
    Top = 392
    Width = 847
    Height = 60
    Align = alBottom
    TabOrder = 0
    ExplicitLeft = 8
    object btnExcluir: TButton
      Left = 720
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 0
    end
    object btnEditar: TButton
      Left = 608
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 1
    end
    object btnNovo: TButton
      Left = 504
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 2
    end
  end
  object dbgrdMoradores: TDBGrid
    Left = 24
    Top = 120
    Width = 801
    Height = 248
    DataSource = dsGridMoradores
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object conexao: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=root;Persist Security Info=True;Use' +
      'r ID=sa;Initial Catalog=PortariaDB;Data Source=Leandro\teste'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 408
  end
  object qryMoradores: TADOQuery
    Connection = conexao
    DataSource = dsGridMoradores
    Parameters = <>
    Left = 80
    Top = 408
  end
  object dsGridMoradores: TDataSource
    Left = 120
    Top = 408
  end
end
