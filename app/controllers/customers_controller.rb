class CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
  　@customer = Customer.find(params[:id])
  end

  def update
  end

  def unsubscribe
  end

  def status
  end

  private

    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :adress, :telephone_number, :email)
    end

end
