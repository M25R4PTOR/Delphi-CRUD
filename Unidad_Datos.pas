unit Unidad_Datos;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDataModuleLogin = class(TDataModule)
    ADOConnection1: TADOConnection;
    Busqueda: TADOQuery;
    Consulta: TADOQuery;
    Datos_Busqueda: TDataSource;
    Datos_consulta: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleLogin: TDataModuleLogin;

implementation

{$R *.dfm}

end.
