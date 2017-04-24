class User < ActiveRecord::Base
  # Associações
  has_many :machine
  has_many :case_diagrams

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
