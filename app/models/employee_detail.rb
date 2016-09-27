class EmployeeDetail < ActiveRecord::Base
	has_many :customers

	belongs_to :user

	validates :emp_id, presence:true, length:{minimaum:2, maximum:25}

	def self.search(param)
	  return EmployeeDetail.none if param.blank?

	  param.strip!
	  param.downcase!

	  (name_matches(param) + emp_id_matches(param)).uniq
	end

	def self.name_matches(param)
	  matches('name', param)
	end

	def self.emp_id_matches(param)
	  matches('emp_id', param)
	end

	def self.matches(field_name, param)
	  where("lower(#{field_name}) like?","%#{param}%")
	end 

end
