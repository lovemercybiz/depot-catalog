class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
    # @session = 1
  end
end
