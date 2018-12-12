Rails.configuration.stripe = {
  :publishable_key => 'pk_test_MEELWIxv9BMrKmnyLolpL2gB',
  :secret_key => 'sk_test_T4T7W8k565Vtf0WkRkMZdVXz'
}
Stripe.api_key = Rails.configuration.stripe[:secret_key]
