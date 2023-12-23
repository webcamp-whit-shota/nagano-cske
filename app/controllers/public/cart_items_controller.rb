class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  # before_action :set_cart_item, only: [:create, :update, :destroy]
  
  def index
    @cart_items = CartItem.all
    @total = 0
  end
  

  
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_items = current_customer.cart_item.all
      @cart_items.each do |cart_item|
        if cart_item.item_id==@cart_item.item_id
          new_amount = cart_item.amount + @cart_item.amount
          cart_item.update_attribute(:amount, new_amount)
          @cart_item.delete
        end
      end
    @cart_item.save
    redirect_to public_cart_items_path
  end
  
  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to public_cart_items_path
  end
  
  def destroy_all
    CartItem.destroy_all
    current_customer.cart_item.destroy_all
    redirect_to public_cart_items_path
  end
  
  private
 
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
  
  # def set_cart_item
  #   @item = Item.find(params[:item_id])
  #   @cart_item = current_customer.curt_item
  # end
  
end