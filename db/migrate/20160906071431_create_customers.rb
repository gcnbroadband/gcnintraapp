class CreateCustomers < ActiveRecord::Migration
	def change
		create_table :customers do |t|
			t.date :date
			t.string :connection_id
			t.string :name
			t.string :mobile_no
			t.string :email
			t.string :telephone_no
			t.date :date_of_birth
			t.text :billing_address
			t.string :pin_no
			t.string :nationality
			t.timestamps
		end
	end
end
