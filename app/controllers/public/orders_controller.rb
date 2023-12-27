class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def new
    @order = Order.new
    # (order_params)
  end
  
  
  # private
  # def order_params
  #   params.require(:order).permit()
    
  # end
  
end
