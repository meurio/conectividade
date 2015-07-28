if Rails.env.production? && ENV["LIVE"]
  PRESIDENT_EMAIL = "Dilma Rousseff <gabinetepessoal@presidencia.gov.br>"
  MINISTERS_EMAILS = [
    "Ricardo Berzoini <chefia.gabinete@comunicacoes.gov.br>",
    "Aloizio Mercadante <agendacasacivil@presidencia.gov.br>",
    "Renato Janine <gabinetedoministro@mec.gov.br>"
  ]
else
  raise "TEST_EMAIL is missing" if ENV["TEST_EMAIL"].nil?
  PRESIDENT_EMAIL = ENV["TEST_EMAIL"]
  MINISTERS_EMAILS = ENV["TEST_CC_EMAIL"]
end
