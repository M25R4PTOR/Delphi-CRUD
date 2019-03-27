object Form1: TForm1
  Left = 1313
  Top = 460
  Width = 505
  Height = 397
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 72
    Width = 20
    Height = 13
    Caption = 'Tipo'
  end
  object T_Usuario: TLabeledEdit
    Left = 24
    Top = 32
    Width = 121
    Height = 21
    EditLabel.Width = 36
    EditLabel.Height = 13
    EditLabel.Caption = 'Usuario'
    TabOrder = 0
  end
  object T_Contrasena: TLabeledEdit
    Left = 176
    Top = 32
    Width = 121
    Height = 21
    EditLabel.Width = 56
    EditLabel.Height = 13
    EditLabel.Caption = 'Contrase'#241'a'
    TabOrder = 1
  end
  object Combo_Tipo: TComboBox
    Left = 24
    Top = 88
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    Text = 'Combo_Tipo'
  end
  object Combo_Tipo2: TComboBox
    Left = 184
    Top = 88
    Width = 49
    Height = 21
    ItemHeight = 13
    TabOrder = 3
    Text = 'ComboBox1'
    Visible = False
  end
  object Grid_Datos: TDBGrid
    Left = 24
    Top = 184
    Width = 441
    Height = 153
    DataSource = DataModuleLogin.Datos_Busqueda
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = Grid_DatosDblClick
  end
  object Boton_Insertar: TButton
    Left = 376
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Insertar'
    TabOrder = 5
    OnClick = Boton_InsertarClick
  end
  object Boton_Actualizar: TButton
    Left = 376
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Actualizar'
    TabOrder = 6
    OnClick = Boton_InsertarClick
  end
  object Boton_Borrar: TButton
    Left = 376
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Borrar'
    TabOrder = 7
    OnClick = Boton_BorrarClick
  end
  object Boton_Cancelar: TButton
    Left = 376
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 8
    OnClick = FormActivate
  end
  object T_Buscar: TEdit
    Left = 24
    Top = 160
    Width = 121
    Height = 21
    TabOrder = 9
  end
  object Boton_Buscar: TButton
    Left = 144
    Top = 160
    Width = 65
    Height = 25
    Caption = 'Buscar'
    TabOrder = 10
    OnClick = Boton_BuscarClick
  end
end
