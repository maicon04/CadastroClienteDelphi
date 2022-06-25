unit U_CAD_CLIENTE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Datasnap.DBClient, Vcl.StdCtrls, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope,idHTTP, Data.DBXJSON,
  DBXJSONReflect, System.JSON, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack,
  IdSSL, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdCookieManager, ssl_openssl, IdSSLOpenSSL, Vcl.ComCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ExtCtrls, IdText, XMLDoc;

 type
   TTipoConsulta = (tcCep, tcEndereco);
 type
   TAdress = record
     CEP,
     logradouro,
     complemento,
     bairro,
     localidade,
     uf,
     unidade,
     IBGE: string
   end;

type
  TFrmCadCliente = class(TForm)
    PNL_INFO: TPanel;
    BTN_NOVO: TButton;
    BTN_GRAVAR: TButton;
    CdsDados_: TClientDataSet;
    CdsDados_NOME: TStringField;
    CdsDados_IDENTIDADE: TStringField;
    CdsDados_CPF: TStringField;
    CdsDados_TELEFONE: TStringField;
    CdsDados_EMAIL: TStringField;
    CdsDados_LOGRADOURO: TStringField;
    CdsDados_CEP: TStringField;
    CdsDados_NUMERO: TStringField;
    CdsDados_COMPLEMENTO: TStringField;
    CdsDados_BAIRRO: TStringField;
    CdsDados_CIDADE: TStringField;
    CdsDados_ESTADO: TStringField;
    CdsDados_PAIS: TStringField;
    CdsDados_ID: TIntegerField;
    DataSource1: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    LBL_ID: TLabel;
    LBL_NOME: TLabel;
    LBL_IDENTIDADE: TLabel;
    LBL_CPF: TLabel;
    LBL_TELEFONE: TLabel;
    LBL_EMAIL: TLabel;
    LBL_ENDERECO: TLabel;
    LBL_CEP: TLabel;
    LBL_NUMERO: TLabel;
    LBL_BAIRRO: TLabel;
    LBL_COMPLEMENTO: TLabel;
    LBL_UF: TLabel;
    EDT_NOME: TDBEdit;
    EDT_IDENTIDADE: TDBEdit;
    EDT_EMAIL: TDBEdit;
    EDT_CEP: TDBEdit;
    EDT_ENDERECO: TDBEdit;
    DBGrid1: TDBGrid;
    EDT_CPF: TDBEdit;
    EDT_TELEFONE: TDBEdit;
    CB_UF: TDBComboBox;
    EDT_NUMERO: TDBEdit;
    EDT_BAIRRO: TDBEdit;
    EDT_COMPLEMENTO: TDBEdit;
    EDT_ID: TDBEdit;
    EDT_CIDADE: TDBEdit;
    LBL_CIDADE: TLabel;
    LBL_PAIS: TLabel;
    EDT_PAIS: TDBEdit;
    TabControl1: TTabControl;
    BTN_EMAIL: TButton;
    EDT_HOST: TEdit;
    LBL_HOST: TLabel;
    LBL_PORTA: TLabel;
    EDT_PORTA: TEdit;
    LBL_USUARIO: TLabel;
    EDT_USUARIO: TEdit;
    EDT_SENHA: TEdit;
    LBL_SENHA: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure EDT_CEPExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BTN_NOVOClick(Sender: TObject);
    procedure BTN_GRAVARClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EDT_TELEFONEKeyPress(Sender: TObject; var Key: Char);
    procedure EDT_IDENTIDADEKeyPress(Sender: TObject; var Key: Char);
    procedure EDT_CPFKeyPress(Sender: TObject; var Key: Char);
    procedure EDT_CEPKeyPress(Sender: TObject; var Key: Char);
    procedure BTN_EMAILClick(Sender: TObject);
  private
    { Private declarations }
    address : TAdress;
    sFolderXML : String;
    function FindCep(params: TAdress; tpConsulta : TTipoConsulta):TJSONObject;
    procedure GetAdress(JSON: TJSONObject);
    procedure GetDataAdress(jsonArray: TJSONArray);
    function strReplace(str:string):string;
    procedure EnaleDisableButtons(Btn : TButton; Enable: Boolean);
    function OnlyNumber(Avalue : char):char;
    procedure ValidateFields();
    procedure ValidateEmpty(Sender: TObject);
    function GetHtmlBody(): String;
    function CreateXmlData(): String;
  public
    { Public declarations }
  end;


var
  FrmCadCliente: TFrmCadCliente;


const
  contentType = 'application/json';



implementation

uses
  U_EMail;

{$R *.dfm}

procedure TFrmCadCliente.BTN_EMAILClick(Sender: TObject);
var
  mail : TEMail;
begin
  // Servidor
  mail.Host          := EDT_HOST.Text;
  mail.Port          := strToInt(EDT_PORTA.Text);
  mail.UserName      := EDT_USUARIO.Text;
  mail.Password      := EDT_SENHA.Text;
  mail.FromName      := EDT_USUARIO.Text;
  mail.FromAddress   := EDT_USUARIO.Text;

  // Destino
  SetLength(Mail.EMails,1);
  Mail.EMails[0].EMailAddresses           := EDT_EMAIL.Text;
  Mail.EMails[0].EMailAddresses_CCList    := '';
  Mail.EMails[0].EMailAddresses_BccList   := '';
  Mail.EMails[0].EMailAddresses_Subject   := Caption;
  Mail.EMails[0].EMailAddresses_Body      := GetHtmlBody();
  SetLength(Mail.EMails[0].EMailAddresses_Attachment,1);
  Mail.EMails[0].EMailAddresses_Attachment[0].AttachmentType := atFileName;
  Mail.EMails[0].EMailAddresses_Attachment[0].AttachmentName := sFolderXML;
  Mail.EMails[0].EMailAddresses_Attachment[0].AttachmentData := sFolderXML;
  //
  EnviarEmail( mail );

end;

procedure TFrmCadCliente.BTN_GRAVARClick(Sender: TObject);
begin
 ValidateFields();
 CdsDados_.Post;
 sFolderXML := CreateXmlData();
 CdsDados_.DisableControls;
 EnaleDisableButtons(BTN_NOVO,True);
 EnaleDisableButtons(BTN_GRAVAR,False);
end;

procedure TFrmCadCliente.BTN_NOVOClick(Sender: TObject);
begin
  CdsDados_.Append;
  CdsDados_.EnableControls;
  EDT_ID.DataSource.DataSet.FieldByName('ID').Value :=  CdsDados_.RecordCount + 1;
  EnaleDisableButtons(BTN_NOVO,FALSE);
  EnaleDisableButtons(BTN_GRAVAR,TRUE);
end;

procedure TFrmCadCliente.Button1Click(Sender: TObject);
var
  jsonObject: TJSONObject;
begin
  address.CEP := '44056828';
  jsonObject  := FindCep(address,tcCep);

  if jsonObject <> nil then
    GetAdress(jsonObject);
end;

function TFrmCadCliente.CreateXmlData: String;
Var
  XMLClient : TXMLDocument;
begin
  XMLClient := TXMLDocument.Create(Nil);
  XMLClient.Active := True;
  XMLClient.AddChild('Clientes');
  XMLClient.DocumentElement.ChildNodes['Cliente'].AddChild('nome').NodeValue := EDT_NOME.Text;
  XMLClient.DocumentElement.ChildNodes['Cliente'].AddChild('Identidade').NodeValue :=EDT_IDENTIDADE.Text;
  XMLClient.DocumentElement.ChildNodes['Cliente'].AddChild('cpf').NodeValue :=EDT_CPF.Text;
  XMLClient.DocumentElement.ChildNodes['Cliente'].AddChild('telefone').NodeValue :=EDT_TELEFONE.Text;
  XMLClient.DocumentElement.ChildNodes['Cliente'].AddChild('email').NodeValue :=EDT_EMAIL.Text;
  XMLClient.DocumentElement.ChildNodes['Cliente'].AddChild('cep').NodeValue :=EDT_CEP.Text;
  XMLClient.DocumentElement.ChildNodes['Cliente'].AddChild('cidade').NodeValue :=EDT_CIDADE.Text;
  XMLClient.DocumentElement.ChildNodes['Cliente'].AddChild('uf').NodeValue :=CB_UF.Text;
  XMLClient.DocumentElement.ChildNodes['Cliente'].AddChild('endereco').NodeValue :=EDT_ENDERECO.Text;
  XMLClient.DocumentElement.ChildNodes['Cliente'].AddChild('numero').NodeValue :=EDT_NUMERO.Text;
  XMLClient.DocumentElement.ChildNodes['Cliente'].AddChild('bairro').NodeValue :=EDT_BAIRRO.Text;
  XMLClient.DocumentElement.ChildNodes['Cliente'].AddChild('complemento').NodeValue :=EDT_COMPLEMENTO.Text;
  XMLClient.DocumentElement.ChildNodes['Cliente'].AddChild('pais').NodeValue :=EDT_PAIS.Text;
  XMLClient.SaveToFile(ExtractFilePath(Application.ExeName)+EDT_NOME.Text+'.xml');
  Result := ExtractFilePath(Application.ExeName)+EDT_NOME.Text+'.xml'
end;

procedure TFrmCadCliente.EDT_CEPExit(Sender: TObject);
var
  jsonObject: TJSONObject;
begin
  if EDT_CEP.Text <> '' then
  begin
    address.CEP := TCustomEdit(Sender).Text;
    jsonObject  := FindCep(address,tcCep);

    if jsonObject <> nil then
      GetAdress(jsonObject);
  end;
end;

procedure TFrmCadCliente.EDT_CEPKeyPress(Sender: TObject; var Key: Char);
begin
  Key := OnlyNumber(Key);
end;

procedure TFrmCadCliente.EDT_CPFKeyPress(Sender: TObject; var Key: Char);
begin
  Key := OnlyNumber(Key);
end;

procedure TFrmCadCliente.EDT_IDENTIDADEKeyPress(Sender: TObject; var Key: Char);
begin
  Key := OnlyNumber(Key);
end;

procedure TFrmCadCliente.EDT_TELEFONEKeyPress(Sender: TObject; var Key: Char);
begin
  Key := OnlyNumber(Key);
end;

procedure TFrmCadCliente.EnaleDisableButtons(Btn: TButton;
  Enable: Boolean);
begin
  Btn.Enabled := Enable;
end;

function TFrmCadCliente.FindCep(params: TAdress; tpConsulta : TTipoConsulta):TJSONObject;
var
  HTTP: TIdHTTP;
  IOHandler: TIdSSLIOHandlerSocketOpenSSL;
  Response: TStringStream;
  JsonArray: TJSONArray;
begin
    try
    HTTP := TIdHTTP.Create;
    IOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
    with IOHandler as TIdSSLIOHandlerSocketOpenSSL do
    begin
      SSLOptions.Method := sslvSSLv23;
      SSLOptions.SSLVersions := [sslvTLSv1_2, sslvTLSv1_1, sslvTLSv1];
    end;
    HTTP.IOHandler := IOHandler;
    HTTP.Request.Accept := contentType;
    HTTP.Request.ContentType := contentType;
    HTTP.Request.CustomHeaders.Clear;
    HTTP.ReadTimeout := 720000;
    HTTP.Request.CustomHeaders.FoldLines := False;
    HTTP.Request.UserAgent := 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1';

    Response := TStringStream.Create('');

    if tpConsulta = tcCep then
    begin
      HTTP.Get('https://viacep.com.br/ws/' + params.CEP + '/json', Response);
      if (HTTP.ResponseCode = 200) and not (UTF8ToString(Response.DataString) = '{'#$A'  "erro": true'#$A'}') then
      begin
        Result := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(UTF8ToString(Response.DataString)), 0) as TJSONObject;
      end
      else
        raise Exception.Create('CEP inexistente!');
    end;

    if tpConsulta = tcEndereco then
    begin
      HTTP.Get('https://viacep.com.br/ws/' + params.uf + '/' + strReplace(params.localidade) + '/' + strReplace(params.logradouro) + '/json', Response);
      if (HTTP.ResponseCode = 200) and not (UTF8ToString(Response.DataString) = '{'#$A'  "erro": true'#$A'}') then
      begin
        JsonArray := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(UTF8ToString(Response.DataString)), 0) as TJSONArray;
        GetDataAdress(JsonArray);
        Result := TJSONObject(JsonArray);
      end
      else
        raise Exception.Create('EndereÁo inexistente ou n„o encontrado!');
    end;

  finally
    FreeAndNil(HTTP);
    FreeAndNil(IOHandler);
    Response.Destroy;
  end;
end;

procedure TFrmCadCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  CdsDados_.Destroy;
end;

procedure TFrmCadCliente.FormCreate(Sender: TObject);
begin
  CdsDados_.CreateDataSet;
  CdsDados_.DisableControls;
  EnaleDisableButtons(BTN_GRAVAR,False);
end;

procedure TFrmCadCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    perform(WM_NEXTDLGCTL,0,0);
end;

procedure TFrmCadCliente.GetAdress(JSON: TJSONObject);
begin

   EDT_PAIS.DataSource.DataSet.FieldByName('PAIS').Value :=  'BRASIL';
   EDT_ENDERECO.DataSource.DataSet.FieldByName('LOGRADOURO').Value :=  UpperCase(JSON.Get('logradouro').JsonValue.Value);
   EDT_CIDADE.DataSource.DataSet.FieldByName('CIDADE').Value :=  UpperCase(JSON.Get('localidade').JsonValue.Value);
   EDT_BAIRRO.DataSource.DataSet.FieldByName('BAIRRO').Value :=  UpperCase(JSON.Get('bairro').JsonValue.Value);
   EDT_COMPLEMENTO.DataSource.DataSet.FieldByName('COMPLEMENTO').Value :=  UpperCase(JSON.Get('complemento').JsonValue.Value);
   CB_UF.DataSource.DataSet.FieldByName('ESTADO').Value :=  UpperCase(JSON.Get('uf').JsonValue.Value);
end;

procedure TFrmCadCliente.GetDataAdress(jsonArray: TJSONArray);
  var
  i : Integer;
  resultados, jsonObjeto : TJSONObject;
begin
  CdsDados_.DisableControls;

  try
    for i := 0 to jsonArray.Size - 1 do
    begin
      CdsDados_.Append;
      CdsDados_LOGRADOURO.AsString  := TJSONObject(jsonArray.Get(i)).Get('logradouro').JsonValue.Value;
      CdsDados_CEP.AsString         := TJSONObject(jsonArray.Get(i)).Get('cep').JsonValue.Value;
      CdsDados_CIDADE.AsString  := UpperCase(TJSONObject(jsonArray.Get(0)).Get('localidade').JsonValue.Value);
      CdsDados_BAIRRO.AsString      := TJSONObject(jsonArray.Get(i)).Get('bairro').JsonValue.Value;
      CdsDados_ESTADO.AsString          := TJSONObject(jsonArray.Get(i)).Get('uf').JsonValue.Value;
      CdsDados_COMPLEMENTO.AsString := TJSONObject(jsonArray.Get(i)).Get('complemento').JsonValue.Value;
      CdsDados_.Post;
    end;
  finally
    CdsDados_.First;
    CdsDados_.EnableControls;
  end;

end;

function TFrmCadCliente.GetHtmlBody: String;

begin
  result := '<html>'
          + '<head>'
          + '<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">'
          + '</head>'
          + '<body>'
          + 'Nome : ' + EDT_NOME.Text  + '<br>'
          + 'Identidade : ' + EDT_IDENTIDADE.Text  + '<br>'
          + 'CPF : ' + EDT_CPF.Text  + '<br>'
          + 'Telefone : ' + EDT_TELEFONE.Text + '<br>'
          + 'Email : ' + EDT_EMAIL.Text + '<br>'
          + 'CEP : ' + EDT_CEP.Text   + '<br>'
          + 'Cidade : ' + EDT_CIDADE.Text  + '<br>'
          + 'UF : ' + CB_UF.Text  + '<br>'
          + 'EndereÁo : ' + EDT_ENDERECO.Text + '<br>'
          + 'N˙mero : ' + EDT_NUMERO.Text  + '<br>'
          + 'Bairro : ' + EDT_BAIRRO.Text  + '<br>'
          + 'Complemento : ' + EDT_COMPLEMENTO.Text + '<br>'
          + 'PaÌs : ' + EDT_PAIS.Text  + '<br>'
          + '</body>'
          + '</html>';
end;



function TFrmCadCliente.OnlyNumber(Avalue: char): char;
begin
  result := Avalue;
  if not (Avalue in [#8, '0'..'9']) then begin
    result := #0;
  end;
end;

function TFrmCadCliente.strReplace(str: string): string;
var
  x: Integer;
const
  text1 = '‡‚ÍÙ˚„ı·ÈÌÛ˙Á¸¿¬ ‘€√’¡…Õ”⁄«‹';
  text2 = 'aaeouaoaeioucuAAEOUAOAEIOUCU';
begin
  for x := 1 to Length(Str) do

    if Pos(Str[x], text1) <> 0 then
      Str[x] := text2[Pos(Str[x], text1)];

  Result := Str;
end;


procedure TFrmCadCliente.ValidateEmpty(Sender: TObject);
begin
  if TCustomEdit(Sender).Text = '' then
  begin
    Application.MessageBox('O preenchimento deste campo È obrigatÛrio!',
                           'Cadastro de Clientes',MB_ICONHAND + MB_OK + MB_SYSTEMMODAL);
    TCustomEdit(Sender).SetFocus;
    Abort;
  end;

end;

procedure TFrmCadCliente.ValidateFields;
begin
  ValidateEmpty(EDT_NOME);
  ValidateEmpty(EDT_IDENTIDADE);
  ValidateEmpty(EDT_CPF);
  ValidateEmpty(EDT_TELEFONE);
  ValidateEmpty(EDT_EMAIL);
  ValidateEmpty(EDT_CEP);
  ValidateEmpty(EDT_CIDADE);
  ValidateEmpty(CB_UF);
  ValidateEmpty(EDT_ENDERECO);
  ValidateEmpty(EDT_NUMERO);
  ValidateEmpty(EDT_BAIRRO);
end;

end.
