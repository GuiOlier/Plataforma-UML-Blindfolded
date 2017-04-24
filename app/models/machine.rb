class Machine < ActiveRecord::Base
  belongs_to :user
  has_many :elements
  has_many :transitions
end
