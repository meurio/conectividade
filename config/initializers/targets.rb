if Rails.env.production? && ENV["LIVE"]
  PRESIDENT_EMAIL = "Dilma Roussef <email@dilma>"
  MINISTERS_EMAILS = [
    "Ricardo Berzoini <email@ministro>",
    "Renato Janine Ribeiro <email@ministro>",
    "Aloizio Mercadante <email@ministro>"
  ]
else
  raise "TEST_EMAIL is missing" if ENV["TEST_EMAIL"].nil?
  PRESIDENT_EMAIL = ENV["TEST_EMAIL"]
  MINISTERS_EMAILS = ENV["TEST_CC_EMAIL"]
end
