module Api::V1

# module Api
#   module v1
    class CustomersController < ApplicationController
      def index
        customers = Customer.order('name ASC');
        # puts customers
        render json: {status:'SUCCESS', message:'Loaded customers', data:customers},status: :ok
      end

      # def calculate_cost
      #   total_cost = 0
      #   flat_fee_per_item = 
      #   total_cost = 
      # end
    end
#   end
# end
end