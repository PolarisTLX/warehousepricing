module Api::V1

# module Api
#   module v1
    class CustomersController < ApplicationController
      def index
        customers = Customer.order('name ASC');
        # puts customers
        render json: {status:'SUCCESS', message:'Loaded customers', data:customers},status: :ok
      end
    end
#   end
# end
end