class UserContact < ApplicationRecord
  belongs_to :user
  has_one :user_address
end
