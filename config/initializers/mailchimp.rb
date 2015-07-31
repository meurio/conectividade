Gibbon::API.api_key = (Rails.env.production? || Rails.env.staging?) ? ENV["MAILCHIMP_API_KEY"] : 'fake'
