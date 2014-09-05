class Order < ActiveRecord::Base
has_many :line_items, dependent: :destroy
belongs_to :user
PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]
validates :name,  presence: true
validates :pay_type, inclusion: PAYMENT_TYPES

end
