Rails.configuration.stripe = {
  :publishable_key => ENV['pk_test_KEY'],
  :secret_key      => ENV['sk_test_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]