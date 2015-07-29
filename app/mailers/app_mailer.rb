class AppMailer < ActionMailer::Base
  default from: 'Liane Lira <liane@internetnaescola.org>'

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

  def user_registered user
    self.student_registered(user) if user.student?
    self.teacher_registered(user) if user.teacher?
  end

  def student_registered user
    headers "X-SMTPAPI" => "{ \"category\": [\"conectividade\", \"student_registered\"] }"
    mail(
      to: user.email,
      template_name: 'student_registered',
      subject: 'Boa, agora você é um puxador do Bonde da Conexão!'
    )
  end

  def teacher_registered user
    headers "X-SMTPAPI" => "{ \"category\": [\"conectividade\", \"teacher_registered\"] }"
    mail(
      to: user.email,
      template_name: 'teacher_registered',
      subject: 'Você está se juntando a pessoas de todo o país por uma internet rápida na escola.'
    )
  end
end
