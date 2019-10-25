module Api::V1
  class CustomersController < ApplicationController

    def index
      @customers = Customer.order('name ASC');
      render json: {status:'SUCCESS', message:'Loaded customers', all_customers:@customers},status: :ok
    end  

    def show
      @customer = Customer.find_by(id: params[:id])
      render json: {status:'SUCCESS', message:'Individual customer', customer:@customer},status: :ok
    end    

    def calculate_cost
      @customer = Customer.find_by(id: params[:customer_id])
      @customer.quantity_of_items = params[:num_items]
      total_cost = @customer.calculate_cost
      render json: {status:'SUCCESS', message:"Total cost for customer: #{@customer.name} for #{params[:num_items]} items", total_cost:total_cost},status: :ok
    end

    private

    def customer_params
      params.require(:customer).permit(
        :id,
        :name
      )
    end

  end
end