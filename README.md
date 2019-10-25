# README

This is a project written in Ruby-on-Rails as an API with an endpoint to quote a customer's expected storage price given n storage items.

# Project dependencies:
-Ruby version: 2.5.5p157
-Rails version: 5.2.3

# To Run The Project:
-open your terminal / command-prompt
-type `git clone https://github.com/PolarisTLX/warehousepricing.git` to clone the project.
-type `cd warehousepricing` to move into the project directory
-type `rails db:migrate` to create the database
-type `rails db:seed` to load the starting data
-start the server with the command `rails s`

-Using Postman (or other tool to make API requests), you can make a GET request to get the total cost for a customer with the endpoint: `http://localhost:3000/api/v1/customers/:customer_id/total_cost/:num_items` (replacing the values of `:customer_id` and `:num_items`).

Example: `http://localhost:3000/api/v1/customers/4/total_cost/300`

Customer "A" is `:customer_id` of 1
Customer "B" is `:customer_id` of 2
Customer "C" is `:customer_id` of 3
Customer "D" is `:customer_id` of 4

`:num_items` can be any number of items you wish to calculate the total cost for.

Results will look like:

```
{
    "status": "SUCCESS",
    "message": "Total cost for customer: D for 300 items",
    "total_cost": 5346.0
}
```