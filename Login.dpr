program Login;

uses
  Forms,
  Unidad_Login in 'Unidad_Login.pas' {Form1},
  Unidad_Datos in 'Unidad_Datos.pas' {DataModuleLogin: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModuleLogin, DataModuleLogin);
  Application.Run;
end.
