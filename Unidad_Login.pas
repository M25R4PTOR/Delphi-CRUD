unit Unidad_Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids;

type
  TForm1 = class(TForm)
    T_Usuario: TLabeledEdit;
    T_Contrasena: TLabeledEdit;
    Combo_Tipo: TComboBox;
    Combo_Tipo2: TComboBox;
    Label1: TLabel;
    Grid_Datos: TDBGrid;
    Boton_Insertar: TButton;
    Boton_Actualizar: TButton;
    Boton_Borrar: TButton;
    Boton_Cancelar: TButton;
    T_Buscar: TEdit;
    Boton_Buscar: TButton;
    procedure FormActivate(Sender: TObject);
    procedure Boton_InsertarClick(Sender: TObject);
    procedure Grid_DatosDblClick(Sender: TObject);
    procedure Boton_BorrarClick(Sender: TObject);
    procedure Boton_BuscarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unidad_Datos;

{$R *.dfm}

procedure TForm1.FormActivate(Sender: TObject);
begin
  DataModuleLogin.Busqueda.SQL.Clear;
  DataModuleLogin.Busqueda.SQL.Add('Select user, pass, id_tipo from login');
  DataModuleLogin.Busqueda.Open;

  T_Usuario.ReadOnly:=False;
  T_Usuario.Text:='';
  T_Contrasena.Text:='';
  T_Buscar.Text:='';
  Combo_Tipo.Clear;
  Combo_Tipo2.Clear;

  DataModuleLogin.Consulta.SQL.Clear;
  DataModuleLogin.Consulta.SQL.Add('Select * from tipo_login order by id_tipo');
  DataModuleLogin.Consulta.Open;

  while not DataModuleLogin.Consulta.Eof do begin
    Combo_Tipo.Items.Add(DataModuleLogin.Consulta.FieldByName('nombre').AsString);
    Combo_Tipo2.Items.Add(DataModuleLogin.Consulta.FieldByName('id_tipo').AsString);
    DataModuleLogin.Consulta.Next;
  end;

  Boton_Insertar.Enabled:=True;
  Boton_Actualizar.Enabled:=False;
  Boton_Borrar.Enabled:=False;  
end;

procedure TForm1.Boton_InsertarClick(Sender: TObject);
begin
  if Combo_Tipo.ItemIndex=-1 then begin
    Application.MessageBox('Seleccione un tipo', 'Falta Información', Mb_IconWarning + Mb_Ok);
    Combo_Tipo.SetFocus;
    Exit;
  end;

  T_Usuario.Text:=Trim(T_Usuario.Text);
  T_Contrasena.Text:=Trim(T_Contrasena.Text);

  if length(T_Usuario.Text)=0 then begin
    Application.MessageBox('Debe escribir un nombre de usuario', 'Falta Información', Mb_IconWarning + Mb_Ok);
    T_Usuario.SetFocus;
    Exit;
  end;

  if length(T_Contrasena.Text)=0 then begin
    Application.MessageBox('Debe escribir una contraseña', 'Falta Información', Mb_IconWarning + Mb_Ok);
    T_Contrasena.SetFocus;
    Exit;
  end;

  if Boton_Insertar.Enabled=True then begin
    DataModuleLogin.Consulta.SQL.Clear;
    DataModuleLogin.Consulta.SQL.Add('Select user from login');
    DataModuleLogin.Consulta.Open;
    while not DataModuleLogin.Consulta.Eof do begin
      if T_Usuario.Text=DataModuleLogin.Consulta.FieldByName('user').AsString then begin
        Application.MessageBox('El usuario ya existe', 'Usuario Repetido', Mb_IconWarning + Mb_Ok);
        T_Usuario.SetFocus;
        Exit;
      end
      else begin
        DataModuleLogin.Consulta.SQL.Clear;
        DataModuleLogin.Consulta.SQL.Add('Insert into login (user, pass, id_tipo) values (' +
                                      QuotedStr(T_Usuario.Text) + ', ' +
                                      QuotedStr(T_Contrasena.Text) + ', ' +
                                      Combo_Tipo2.Items[Combo_Tipo.ItemIndex] + ')');
        DataModuleLogin.Consulta.ExecSQL;
        FormActivate(Sender);
      end;
      DataModuleLogin.Consulta.Next;
    end;
  end
  else begin
    T_Usuario.ReadOnly:=True;
    DataModuleLogin.Consulta.SQL.Clear;
    DataModuleLogin.Consulta.SQL.Add('update login set pass=' + QuotedStr(T_Contrasena.Text) +
                                        ', id_tipo=' + Combo_Tipo2.Items[Combo_Tipo.ItemIndex] +
                                        ' where user='+ QuotedStr(T_Usuario.Text));
    DataModuleLogin.Consulta.ExecSQL;
  end;
  FormActivate(Sender);
end;

procedure TForm1.Grid_DatosDblClick(Sender: TObject);
var x:integer;
begin
  T_Usuario.Text:=Grid_Datos.Fields[0].AsString;
  T_Contrasena.Text:=Grid_Datos.Fields[1].AsString;
  DataModuleLogin.Consulta.SQL.Clear;
  DataModuleLogin.Consulta.SQL.Add('Select * from tipo_login where id_tipo=' + Grid_Datos.Fields[2].AsString);
  DataModuleLogin.Consulta.Open;

  For x:=0 to Combo_Tipo.Items.Count-1 do begin
    if Combo_Tipo2.Items[x]=DataModuleLogin.Consulta.FieldByName('id_tipo').AsString then begin
      Combo_Tipo.ItemIndex:=x;
    end;
  end;
  T_Usuario.ReadOnly:=True;
  Boton_Insertar.Enabled:=False;
  Boton_Actualizar.Enabled:=True;
  Boton_Borrar.Enabled:=True;
end;

procedure TForm1.Boton_BorrarClick(Sender: TObject);
begin
  if Application.MessageBox('¿Desea eliminar el registro?', 'Eliminación...', Mb_IconQuestion + Mb_YesNo)=Id_No then Exit;

  DataModuleLogin.Consulta.SQL.Clear;
  DataModuleLogin.Consulta.SQL.Add('Delete from login where user=' + QuotedStr(T_Usuario.Text));
  DataModuleLogin.Consulta.ExecSQL;

  FormActivate(Sender);
end;

procedure TForm1.Boton_BuscarClick(Sender: TObject);
begin
  DataModuleLogin.Busqueda.SQL.Clear;
  DataModuleLogin.Busqueda.SQL.Add('Select user, pass, id_tipo from login where user like ' + QuotedStr('%' + T_Buscar.Text + '%') + ' or pass like ' + QuotedStr('%' + T_Buscar.Text + '%'));
  DataModuleLogin.Busqueda.Open;
end;

end.
