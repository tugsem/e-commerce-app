class CartController < ApplicationController
  def show; end

  def create
    @product = Product.find(params[:id])
    quantity = params[:quantity].to_i
    current_orderable = @cart.orderables.find_by(product_id: @product.id)
    if current_orderable
      current_orderable.update(quantity: quantity)
      #turbo_stream.append(render_to_string(partial: 'orderables', locals: { orderable: current_orderable }))
    else
      @cart.orderables.create(product: @product, quantity: quantity)
      turbo_stream
    end
  end

  def update
    @current_orderable = @cart.orderables.find_by(product_id: params[:id])
      if @current_orderable
        quantity = params[:quantity].to_i
        @current_orderable.update(quantity: quantity)
        @orderable_id = @current_orderable.id
        puts "-----------------------------" + @current_orderable.total.to_s + "-----------------------------"
        turbo_stream
      else
        puts "Couldn't find orderable"
      end
  end

  def destroy
    Orderable.find_by(id: params[:id]).destroy
    turbo_stream
  end
end
