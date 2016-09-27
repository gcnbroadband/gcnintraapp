class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :customers
  has_many :employee_details

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
