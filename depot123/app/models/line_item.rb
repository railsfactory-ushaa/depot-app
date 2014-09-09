class LineItem < ActiveRecord::Base
belongs_to :product
belongs_to :order
belongs_to :user
belongs_to :history
belongs_to :profile

def total_price
  product.price*quantity 
end


end
