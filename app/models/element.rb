class Element < ActiveRecord::Base
  belongs_to :machine
  belongs_to :type
end
