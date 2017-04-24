class Component < ActiveRecord::Base
  belongs_to :case
  belongs_to :mold
end
