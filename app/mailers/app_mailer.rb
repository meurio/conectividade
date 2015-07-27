class AppMailer < ActionMailer::Base
  default from: 'Liane - Minha Sampa <liane@minhasampa.org.br>'

  def thanks message
    @message = message
    headers "X-SMTPAPI" => "{ \"category\": [\"conectividade\", \"thanks\"] }"
    mail(
      to: @message.user.email,
      subject: 'Boa, seu pedido para a presidenta Dilma e para os Ministros foi enviado!'
    )
  end

  def message_for_the_president message
    @message = message
    headers "X-SMTPAPI" => "{ \"category\": [\"conectividade\", \"message_for_the_president\"] }"
    mail(
      to: PRESIDENT_EMAIL,
      cc: MINISTERS_EMAILS,
      from: "#{@message.user.name} <resposta@internetnaescola.org>",
      subject: 'Na pátria educadora, a melhor internet da cidade deve estar na escola!'
    )
  end
end
