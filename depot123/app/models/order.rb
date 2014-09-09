class Order < ActiveRecord::Base
has_many :line_items, dependent: :destroy
belongs_to :user
after_create :add_status
PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]
validates :name,  presence: true
validates :pay_type, inclusion: PAYMENT_TYPES

def add_status
  self.update_attributes(status: "pending")
end

end
