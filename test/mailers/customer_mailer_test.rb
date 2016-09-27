require 'test_helper'

class CustomerMailerTest < ActionMailer::TestCase
  test "customer_confirmation" do
    mail = CustomerMailer.customer_confirmation
    assert_equal "Customer confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
