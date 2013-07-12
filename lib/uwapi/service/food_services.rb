require_relative 'abstraction'
module FoodServices
  include Abstraction
  call_without_q(['FoodServices', 'FoodMenu', 'VendingMachines', 'WatcardVendors'])
end