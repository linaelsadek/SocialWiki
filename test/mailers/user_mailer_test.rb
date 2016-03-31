require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "account_activation" do
    user = users(:michael)
    user.activation_token = User.new_token
    mail = UserMailer.account_activation(user)
    assert_equal "Socialwiki Account Activation", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@socialwiki.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "password_reset" do
    user = users(:michael)
    user.activation_token = User.new_token
    mail = UserMailer.password_reset(user)
    assert_equal "Password reset", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@socialwiki.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
