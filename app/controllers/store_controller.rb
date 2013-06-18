class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
    @cart = current_cart
    increment_counter
  end
end
