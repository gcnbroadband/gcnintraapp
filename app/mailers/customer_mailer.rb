class CustomerMailer < ActionMailer::Base
  default from: "gcnbroadband@example.com"

  def customer_confirmation(customer)
    @customer = customer

    mail to: customer.email, subject: "Customer confirmation"
  end
end
