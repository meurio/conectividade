Gibbon::API.api_key = Rails.env.production? ? ENV["MAILCHIMP_API_KEY"] : 'fake'
