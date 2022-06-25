program CadastroCliente;

uses
  Vcl.Forms,
  U_CAD_CLIENTE in 'U_CAD_CLIENTE.pas' {FrmCadCliente},
  U_EMAIL in 'U_EMAIL.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmCadCliente, FrmCadCliente);
  Application.Run;
end.
