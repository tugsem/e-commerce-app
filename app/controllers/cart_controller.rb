class CartController < ApplicationController
  def show; end

  def add
    @product = Product.find(params[:id])
    quantity = params[:quantity].to_i
    current_orderable = @cart.orderables.find_by(product_id: @product.id)
    if current_orderable && quantity.positive?
      current_orderable.update(quantity:)
      turbo_stream.append(render_to_string(partial: 'orderables', locals: { orderable: current_orderable }))
    elsif quantity <= 0
      current_orderable.destroy
    else
      @cart.orderables.create(product: @product, quantity:)
      redirect_to products_path, notice: 'Item added to cart.'
    end
  end

  def remove
    Orderable.find_by(id: params[:id]).destroy
    redirect_to cart_path, notice: 'Item successfully removed.'
  end
end
