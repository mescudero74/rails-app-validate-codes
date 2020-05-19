class Code < ApplicationRecord
  validates :amount, :email, :code, :status, :username, presence: true
end
