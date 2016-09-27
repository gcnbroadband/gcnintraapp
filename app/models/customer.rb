class Customer < ActiveRecord::Base
	mount_uploader :address_proof, AddressProofUploader
	mount_uploader :identity_proof, IdentityProofUploader
	belongs_to :employee_detail
	belongs_to :user
	has_one :payment_detail
	has_many :bill_books
	accepts_nested_attributes_for :bill_books
	accepts_nested_attributes_for :payment_detail
	accepts_nested_attributes_for :employee_detail

	validates :date, presence:true, length:{minimaum:3, maximum:25}
	validates :connection_id, presence:true, length:{minimaum:3, maximum:25}
	validates :name, presence:true, length:{minimaum:2, maximum:25}
	validates :mobile_no, presence:true, length:{minimaum:10, maximum:12}
	validates :email, presence:true, length:{minimaum:3, maximum:25}
	validates :telephone_no, presence:true, length:{minimaum:3, maximum:25}
	validates :date_of_birth, presence:true, length:{minimaum:3, maximum:25}
	validates :billing_address, presence:true, length:{minimaum:3, maximum:255}
	validates :pin_no, presence:true, length:{minimaum:2, maximum:25}
	validates :nationality, presence:true, length:{minimaum:3, maximum:25}
	validates :installation_address, presence:true, length:{minimaum:3, maximum:255}
	validates :installation_pin_no, presence:true, length:{minimaum:2, maximum:25}
	validates :installation_telephone_no, presence:true, length:{minimaum:2, maximum:15}
	validates :installation_mobile_no, presence:true, length:{minimaum:10, maximum:12}
	validates :installation_email, presence:true, length:{minimaum:2, maximum:25}
	validates :net_plan, presence:true, length:{minimaum:2, maximum:255}
	validates :address_proof, presence:true
	validates :address_proof_type, presence:true, length:{minimaum:2, maximum:25}
	validates :identity_proof, presence:true
	validates :identity_proof_type, presence:true, length:{minimaum:2, maximum:25}
	validates :identity_proof_no, presence:true, length:{minimaum:1, maximum:255}
	validates :address_proof_no, presence:true, length:{minimaum:1, maximum:255}

	def self.search(param)
	  return Customer.none if param.blank?

	  param.strip!
	  param.downcase!

	  (connection_id_matches(param) + name_matches(param) + email_matches(param) + mobile_no_matches(param) +telephone_no_matches(param)).uniq
	end

	def self.connection_id_matches(param)
	  matches('connection_id', param)
	end

	def self.name_matches(param)
	  matches('name', param)
	end

	def self.email_matches(param)
	  matches('email', param)
	end
	def self.mobile_no_matches(param)
	  matches('mobile_no', param)
	end
	def self.telephone_no_matches(param)
	  matches('telephone_no', param)
	end

	def self.matches(field_name, param)
	  where("lower(#{field_name}) like?","%#{param}%")
	end 
end
