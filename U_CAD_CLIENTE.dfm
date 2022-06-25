object FrmCadCliente: TFrmCadCliente
  Left = 0
  Top = 0
  Caption = 'Cadastro de Clientes'
  ClientHeight = 629
  ClientWidth = 1032
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object PNL_INFO: TPanel
    Left = 0
    Top = 0
    Width = 1032
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object BTN_NOVO: TButton
      Left = 13
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 0
      OnClick = BTN_NOVOClick
    end
    object BTN_GRAVAR: TButton
      Left = 94
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Gravar'
      TabOrder = 1
      OnClick = BTN_GRAVARClick
    end
    object BTN_EMAIL: TButton
      Left = 175
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Enviar E-mail'
      TabOrder = 2
      OnClick = BTN_EMAILClick
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 41
    Width = 1032
    Height = 588
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Cadastro'
      object LBL_ID: TLabel
        Left = 24
        Top = 47
        Width = 14
        Height = 16
        Caption = 'ID'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LBL_NOME: TLabel
        Left = 24
        Top = 96
        Width = 35
        Height = 16
        Caption = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LBL_IDENTIDADE: TLabel
        Left = 447
        Top = 96
        Width = 76
        Height = 16
        Caption = 'IDENTIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LBL_CPF: TLabel
        Left = 543
        Top = 96
        Width = 22
        Height = 16
        Caption = 'CPF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LBL_TELEFONE: TLabel
        Left = 671
        Top = 96
        Width = 55
        Height = 16
        Caption = 'Telefone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LBL_EMAIL: TLabel
        Left = 24
        Top = 145
        Width = 40
        Height = 16
        Caption = 'EMAIL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LBL_ENDERECO: TLabel
        Left = 24
        Top = 192
        Width = 64
        Height = 16
        Caption = 'ENDERE'#199'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LBL_CEP: TLabel
        Left = 447
        Top = 144
        Width = 23
        Height = 16
        Caption = 'CEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LBL_NUMERO: TLabel
        Left = 447
        Top = 193
        Width = 52
        Height = 16
        Caption = 'N'#218'MERO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LBL_BAIRRO: TLabel
        Left = 543
        Top = 192
        Width = 50
        Height = 16
        Caption = 'BAIRRO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LBL_COMPLEMENTO: TLabel
        Left = 24
        Top = 240
        Width = 92
        Height = 16
        Caption = 'COMPLEMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LBL_UF: TLabel
        Left = 746
        Top = 145
        Width = 14
        Height = 16
        Caption = 'UF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LBL_CIDADE: TLabel
        Left = 543
        Top = 144
        Width = 48
        Height = 16
        Caption = 'CIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LBL_PAIS: TLabel
        Left = 447
        Top = 240
        Width = 31
        Height = 16
        Caption = 'PA'#205'S'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EDT_NOME: TDBEdit
        Left = 24
        Top = 118
        Width = 417
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOME'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object EDT_IDENTIDADE: TDBEdit
        Left = 447
        Top = 117
        Width = 90
        Height = 21
        CharCase = ecUpperCase
        DataField = 'IDENTIDADE'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnKeyPress = EDT_IDENTIDADEKeyPress
      end
      object EDT_EMAIL: TDBEdit
        Left = 24
        Top = 167
        Width = 417
        Height = 21
        CharCase = ecUpperCase
        DataField = 'EMAIL'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object EDT_CEP: TDBEdit
        Left = 447
        Top = 166
        Width = 90
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CEP'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnExit = EDT_CEPExit
        OnKeyPress = EDT_CEPKeyPress
      end
      object EDT_ENDERECO: TDBEdit
        Left = 24
        Top = 215
        Width = 417
        Height = 21
        CharCase = ecUpperCase
        DataField = 'LOGRADOURO'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
      object EDT_CPF: TDBEdit
        Left = 543
        Top = 118
        Width = 122
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CPF'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnKeyPress = EDT_CPFKeyPress
      end
      object CB_UF: TDBComboBox
        Left = 746
        Top = 166
        Width = 47
        Height = 21
        CharCase = ecUpperCase
        DataField = 'ESTADO'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        Items.Strings = (
          'AC '
          'AL '
          'AP '
          'AM '
          'BA '
          'CE '
          'DF '
          'ES '
          'GO '
          'MA '
          'MT '
          'MS '
          'MG '
          'PA '
          'PB '
          'PR '
          'PE '
          'PI '
          'RJ '
          'RN '
          'RS '
          'RO '
          'RR '
          'SC '
          'SP '
          'SE '
          'TO ')
        ParentFont = False
        TabOrder = 7
      end
      object EDT_NUMERO: TDBEdit
        Left = 447
        Top = 215
        Width = 90
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NUMERO'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
      end
      object EDT_ID: TDBEdit
        Left = 24
        Top = 69
        Width = 64
        Height = 21
        CharCase = ecUpperCase
        DataField = 'ID'
        DataSource = DataSource1
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 11
        ParentFont = False
        TabOrder = 13
      end
      object EDT_TELEFONE: TDBEdit
        Left = 671
        Top = 118
        Width = 122
        Height = 21
        CharCase = ecUpperCase
        DataField = 'TELEFONE'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnKeyPress = EDT_TELEFONEKeyPress
      end
      object EDT_COMPLEMENTO: TDBEdit
        Left = 24
        Top = 262
        Width = 417
        Height = 21
        CharCase = ecUpperCase
        DataField = 'COMPLEMENTO'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
      end
      object EDT_BAIRRO: TDBEdit
        Left = 543
        Top = 214
        Width = 250
        Height = 21
        CharCase = ecUpperCase
        DataField = 'BAIRRO'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
      end
      object EDT_CIDADE: TDBEdit
        Left = 543
        Top = 166
        Width = 197
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CIDADE'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object EDT_PAIS: TDBEdit
        Left = 447
        Top = 262
        Width = 346
        Height = 21
        CharCase = ecUpperCase
        DataField = 'PAIS'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
      end
      object TabControl1: TTabControl
        Left = 0
        Top = 350
        Width = 1024
        Height = 210
        Align = alBottom
        TabOrder = 14
        Tabs.Strings = (
          'Configura'#231#227'o de E-mail')
        TabIndex = 0
        object LBL_HOST: TLabel
          Left = 9
          Top = 31
          Width = 83
          Height = 16
          Caption = 'HOST E-MAIL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LBL_PORTA: TLabel
          Left = 252
          Top = 31
          Width = 43
          Height = 16
          Caption = 'PORTA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LBL_USUARIO: TLabel
          Left = 327
          Top = 31
          Width = 57
          Height = 16
          Caption = 'USU'#193'RIO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LBL_SENHA: TLabel
          Left = 597
          Top = 31
          Width = 42
          Height = 16
          Caption = 'SENHA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EDT_HOST: TEdit
          Left = 9
          Top = 53
          Width = 237
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
        end
        object EDT_PORTA: TEdit
          Left = 252
          Top = 53
          Width = 69
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 1
        end
        object EDT_SENHA: TEdit
          Left = 597
          Top = 53
          Width = 196
          Height = 21
          PasswordChar = '*'
          TabOrder = 3
        end
        object EDT_USUARIO: TEdit
          Left = 327
          Top = 53
          Width = 264
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 2
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Consulta'
      ImageIndex = 1
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 1024
        Height = 560
        Align = alClient
        DataSource = DataSource1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
  end
  object CdsDados_: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'NOME'
        Attributes = [faRequired]
        DataType = ftString
        Size = 80
      end
      item
        Name = 'IDENTIDADE'
        Attributes = [faRequired]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CPF'
        Attributes = [faRequired]
        DataType = ftString
        Size = 11
      end
      item
        Name = 'TELEFONE'
        Attributes = [faRequired]
        DataType = ftString
        Size = 11
      end
      item
        Name = 'EMAIL'
        Attributes = [faRequired]
        DataType = ftString
        Size = 100
      end
      item
        Name = 'LOGRADOURO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 100
      end
      item
        Name = 'CEP'
        Attributes = [faRequired]
        DataType = ftString
        Size = 8
      end
      item
        Name = 'NUMERO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'COMPLEMENTO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'BAIRRO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 100
      end
      item
        Name = 'CIDADE'
        Attributes = [faRequired]
        DataType = ftString
        Size = 100
      end
      item
        Name = 'ESTADO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PAIS'
        Attributes = [faRequired]
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    Params = <>
    StoreDefs = True
    Left = 360
    Top = 360
    object CdsDados_ID: TIntegerField
      FieldName = 'ID'
    end
    object CdsDados_NOME: TStringField
      DisplayWidth = 50
      FieldName = 'NOME'
      Required = True
      Size = 80
    end
    object CdsDados_IDENTIDADE: TStringField
      DisplayWidth = 12
      FieldName = 'IDENTIDADE'
      Required = True
      Size = 10
    end
    object CdsDados_CPF: TStringField
      FieldName = 'CPF'
      Required = True
      EditMask = '000\.000\.000\-00;0;_'
      Size = 11
    end
    object CdsDados_TELEFONE: TStringField
      FieldName = 'TELEFONE'
      Required = True
      EditMask = '!\(99\)00000-0000;0;_'
      Size = 11
    end
    object CdsDados_EMAIL: TStringField
      DisplayWidth = 50
      FieldName = 'EMAIL'
      Required = True
      Size = 100
    end
    object CdsDados_LOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Required = True
      Visible = False
      Size = 100
    end
    object CdsDados_CEP: TStringField
      FieldName = 'CEP'
      Required = True
      Visible = False
      Size = 8
    end
    object CdsDados_NUMERO: TStringField
      FieldName = 'NUMERO'
      Required = True
      Visible = False
      Size = 10
    end
    object CdsDados_COMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Visible = False
      Size = 100
    end
    object CdsDados_BAIRRO: TStringField
      FieldName = 'BAIRRO'
      Required = True
      Visible = False
      Size = 100
    end
    object CdsDados_CIDADE: TStringField
      FieldName = 'CIDADE'
      Required = True
      Visible = False
      Size = 100
    end
    object CdsDados_ESTADO: TStringField
      FieldName = 'ESTADO'
      Required = True
      Visible = False
    end
    object CdsDados_PAIS: TStringField
      FieldName = 'PAIS'
      Required = True
      Visible = False
      Size = 50
    end
  end
  object DataSource1: TDataSource
    DataSet = CdsDados_
    Left = 280
    Top = 368
  end
end
