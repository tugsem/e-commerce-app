
class CheckoutsController < ApplicationController
  before_action :authenticate_user!

  def show
    stripe_secret_key = Rails.application.credentials.dig(:stripe, :secret_key)
    Stripe.api_key = stripe_secret_key

    line_items = @cart.orderables.map do |orderable|
      product = Product.find(orderable["product_id"])
      total = orderable.total
      {
        quantity: orderable["quantity"].to_i,
        price_data: {
          product_data: {
            name: product["product_name"],
            metadata: {
              product_id: product.id,
            }},
            currency: "usd",
            unit_amount: total.to_i*100,
          }
        }
    end

    session = Stripe::Checkout::Session.create(
        mode: 'payment',
        line_items: line_items,
        success_url: checkout_success_url,
        shipping_address_collection: {
          allowed_countries: ["US", "CA", "TR"]
        }
      )
      redirect_to session.url, allow_other_host: true
  end

  def success
    render :success
  end
end
