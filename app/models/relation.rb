class Relation < ActiveRecord::Base
  belongs_to :case
  belongs_to :connection
end
