class ApplicationController < ActionController::Base
  require "stripe"

  before_action :initialize_cart
  before_action :authenticate_user!


  def initialize_cart
    @cart ||= Cart.find_by(id: session[:cart_id])

    return unless @cart.nil?

    @cart = Cart.create
    session[:cart_id] = @cart.id
  end
end

