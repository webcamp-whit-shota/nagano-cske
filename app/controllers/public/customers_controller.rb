class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  
  def show
    @customer = current_customer

  end
  
  def confirm
    
  end
  
  def edit
    is_matching_login_customer
    @customer = current_customer
  end
  
  
  
  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to public_customer_path
  end
  
  def withdrawal
    @customer = current_customer
    @customer.update(is_active: false)
    reset_session
    redirect_to root_path, notice: "退会処理が完了しました"
  end
  
  private
  
  def customer_params
    params.require(:customer).permit( :last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_active )
  end
  
  def is_matching_login_customer
    customer = current_customer
    unless customer.id = current_customer.id
      redirect_to edit_public_customer_path
    end
  end
end
