class AppMailer < ActionMailer::Base
  default from: 'Liane - Minha Sampa <liane@minhasampa.org.br>'

  def thanks message
    @message = message
    headers "X-SMTPAPI" => "{ \"category\": [\"conectividade\", \"thanks\"] }"
    mail(
      to: @message.user.email,
      subject: 'Boa, seu recado para a Presidência da República foi enviado!'
    )
  end
end
