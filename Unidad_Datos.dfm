object DataModuleLogin: TDataModuleLogin
  OldCreateOrder = False
  Left = 1360
  Top = 118
  Height = 259
  Width = 397
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;User ID=root;Data' +
      ' Source=delphi'
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 56
    Top = 40
  end
  object Busqueda: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 296
    Top = 40
  end
  object Consulta: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 168
    Top = 40
  end
  object Datos_Busqueda: TDataSource
    DataSet = Busqueda
    Left = 296
    Top = 152
  end
  object Datos_consulta: TDataSource
    DataSet = Consulta
    Left = 168
    Top = 152
  end
end
