class Case < ActiveRecord::Base
  belongs_to :user
  has_many :components
  has_many :relations
end
