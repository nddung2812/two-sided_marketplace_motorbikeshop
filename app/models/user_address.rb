class UserAddress < ApplicationRecord
  belongs_to :user_contact
  has_one :state
end
