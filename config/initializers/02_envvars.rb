if Rails.env.test?
  ENV["TEST_EMAIL"] = 'Presidente Teste <president@trash-mail.com>'
end
