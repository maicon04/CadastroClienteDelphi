{*******************************************************************************



}
unit U_EMAIL;

interface

uses
  System.Classes,
  System.SysUtils,
  IdComponent,
  IdTCPConnection,
  IdTCPClient,
  IdHTTP,
  IdBaseComponent,
  IdMessage,
  IdExplicitTLSClientServerBase,
  IdMessageClient,
  IdSMTPBase,
  IdSMTP,
  IdIOHandler,
  IdIOHandlerSocket,
  IdIOHandlerStack,
  IdSSL,
  IdSSLOpenSSL,
  IdAttachmentFile,
  IdAttachmentMemory,
  IdText;

type
  TAttachmentType = (atFileName, atStringData);
  TEMailAddressesAttachment = record
    AttachmentType              : TAttachmentType;  // FileName ou String
    AttachmentName,
    AttachmentData              : String;
  end;
  TEMailAddresses = record
    EMailAddresses,
    EMailAddresses_CCList,
    EMailAddresses_BccList,
    EMailAddresses_Subject,
    EMailAddresses_Body,
    EMailAddresses_Result       : String;
    EMailAddresses_Attachment   : Array Of TEMailAddressesAttachment;
  end;
  TEMail = record
    Host                        : String;
    Port                        : Integer;
    UserName,
    Password,
    FromName,
    FromAddress,
    Result                      : String;

    EMails                      : Array of TEMailAddresses;
  end;

  procedure EnviarEmail( var mail :TEMail );

implementation

  procedure EnviarEmail( var mail :TEMail );
  var
    i, ii                : Integer;
    idMsg                : TIdMessage;
    IdText               : TIdText;
    idSMTP               : TIdSMTP;
    IdSSLIOHandlerSocket : TIdSSLIOHandlerSocketOpenSSL;
    stm                  : TStringStream;
  begin
    try
      try
        //
        stm                  := TStringStream.Create;
        //Configura os parâmetros necessários para SSL
        IdSSLIOHandlerSocket                   := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
        IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
        IdSSLIOHandlerSocket.SSLOptions.Mode   := sslmClient;
        //Prepara o Servidor
        IdSMTP                           := TIdSMTP.Create(nil);
        IdSMTP.IOHandler                 := IdSSLIOHandlerSocket;
        IdSMTP.UseTLS                    := utUseExplicitTLS; //utUseImplicitTLS;
        IdSMTP.AuthType                  := satDefault;
        IdSMTP.Host                      := mail.Host;
        IdSMTP.AuthType                  := satDefault;
        IdSMTP.Port                      := mail.Port;
        IdSMTP.Username                  := mail.UserName;
        IdSMTP.Password                  := mail.Password;

        //Conecta e Autentica
        IdSMTP.Connect;
        IdSMTP.Authenticate;

        //Variável referente a mensagem
        idMsg                            := TIdMessage.Create(nil);
        //
        for I := Low(mail.EMails) to High(mail.EMails) do
        begin
          idMsg.Clear;
          idMsg.CharSet                    := 'utf-8';
          idMsg.Encoding                   := meMIME;
          idMsg.From.Name                  := mail.FromName;
          idMsg.From.Address               := mail.FromAddress;
          idMsg.Priority                   := mpNormal;
          idMsg.Subject                    := mail.EMails[i].EMailAddresses_Subject;

          //Add Destinatário(s)
          idMsg.Recipients.Add;
          idMsg.Recipients.EMailAddresses  := mail.EMails[i].EMailAddresses;
          idMsg.CCList.EMailAddresses      := mail.EMails[i].EMailAddresses_CCList;
          idMsg.BccList.EMailAddresses     := mail.EMails[i].EMailAddresses_BccList; //Cópia Oculta

          //Variável do texto
          IdText                           := TIdText.Create(idMsg.MessageParts);
          idText.ContentType               := 'text/html; text/plain; charset=iso-8859-1';
          idText.Body.Add(mail.EMails[i].EMailAddresses_Body);

          // Avalia anexos
          for II := Low(mail.EMails[I].EMailAddresses_Attachment) to High(mail.EMails[I].EMailAddresses_Attachment) do
          begin
            if mail.EMails[I].EMailAddresses_Attachment[ii].AttachmentType = atFileName then
              if FileExists(mail.EMails[I].EMailAddresses_Attachment[ii].AttachmentName) then
                TIdAttachmentFile.Create(idMsg.MessageParts,
                                         mail.EMails[I].EMailAddresses_Attachment[ii].AttachmentName );
            if mail.EMails[I].EMailAddresses_Attachment[ii].AttachmentType = atStringData then
            begin
              stm.Clear;
              stm.WriteString( mail.EMails[I].EMailAddresses_Attachment[ii].AttachmentData );
              stm.Position := 0;
              TIdAttachmentMemory.Create(idMsg.MessageParts,
                                         stm);
              idMsg.MessageParts[idMsg.MessageParts.Count-1].FileName :=
                mail.EMails[I].EMailAddresses_Attachment[ii].AttachmentName;
            end;
          end;

          //Se a conexão foi bem sucedida, envia a mensagem
          if IdSMTP.Connected then
          begin
            try
              IdSMTP.Send(idMsg);
            except
              on E:Exception do
              begin
                mail.EMails[i].EMailAddresses_Result := 'Erro: ' + e.Message;
                mail.Result := 'Erro';
              end;
            end;
          end;
        end;
        //Depois de tudo pronto, desconecta do servidor SMTP
        if IdSMTP.Connected then
          IdSMTP.Disconnect;

      finally
        if IdSMTP.Connected then
          IdSMTP.Disconnect;

        UnLoadOpenSSLLibrary;

        FreeAndNil(idMsg);
        FreeAndNil(IdSSLIOHandlerSocket);
        FreeAndNil(idSMTP);
      end;
    except on e:Exception do
      begin
        mail.Result := e.Message;
      end;
    end;
  end;


end.
