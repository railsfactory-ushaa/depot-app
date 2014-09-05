class User < ActiveRecord::Base
after_create :add_user_role
after_destroy :ensure_an_admin_remains
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #validates :name, presence: true, uniqueness: true
  #has_secure_password

has_many :line_items
has_many :orders
has_many :histories

def add_user_role
    self.update_attributes(role: "user")
end

 private
 def ensure_an_admin_remains
  if User.count.zero?
    raise "Can't delete last user"
  end
 end
end

  
