class User < ApplicationRecord
  validates :name, :birthday, presence: true
end
