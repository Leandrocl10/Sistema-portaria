unit UnitLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB,UnitPrincipal;

type
  TFormLogin = class(TForm)
    lblUsuario: TLabel;
    lblSenha: TLabel;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    btnEntar: TButton;
    btnCancelar: TButton;
    lblSistemaPortaria: TLabel;
    conexao: TADOConnection;
    qryLogin: TADOQuery;
    procedure btnEntarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLogin: TFormLogin;

implementation

{$R *.dfm}

procedure TFormLogin.btnCancelarClick(Sender: TObject);
begin
Close;
end;

procedure TFormLogin.btnEntarClick(Sender: TObject);

begin
conexao.Connected := True;
  qryLogin.Close;
  qryLogin.SQL.Clear;
  qryLogin.SQL.Add('SELECT * FROM Usuarios');
  qryLogin.SQL.Add('WHERE Usuario = :Usuarios AND Senha = :Senha');
  qryLogin.Parameters.ParamByName('Usuarios').Value := edtUsuario.Text;
  qryLogin.Parameters.ParamByName('Senha').Value := edtSenha.Text;
  qryLogin.Open;

  if not qryLogin.IsEmpty then
  begin
    Hide;
    FormPrincipal := TFormPrincipal.Create(nil);
    try
    formPrincipal.ShowModal;
    finally
    FormPrincipal.Free;
    end;
    Show;
  end
  else
  ShowMessage('Usuário ou senha inválidos!')
end;


end.
