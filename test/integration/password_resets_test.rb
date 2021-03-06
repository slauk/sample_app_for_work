require "test_helper"

class PasswordResetsTest < ActionDispatch::IntegrationTest
  def setup
    ActionMailer::Base.deliveries.clear
    @user = users(:michael)
  end

  test "password reset" do 
    get new_password_reset_path
    assert_template 'password_resets/new'
    assert_select 'input[name=?]', 'password_reset[email]'
    post password_resets_path, params: {password_reset:{email: ""}}
    assert_not flash.empty?
    assert_template 'password_resets/new'
    post password_resets_path, params: { password_reset: { email: @user.email } }
    assert_not_equal @user.reset_digest, @user.reload.reset_digest
    assert_equal 1, ActionMailer::Base.deliveries.size
    assert_not flash.empty?
    assert_redirected_to root_url
    user = assigns(:user)
    get edit_password_reset_path(user.reset_token, email: "")
    assert_redirected_to root_url
    patch password_reset_path(user.reset_token), params: { email: user.email, user: { password: "foobaz", password_confirmation: "foobaz" } }
    assert is_logged_in?
    assert_not flash.empty?
    assert_redirected_to user
  end

end
