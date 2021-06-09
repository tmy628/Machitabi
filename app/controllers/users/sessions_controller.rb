class Users::SessionsController < Devise::SessionsController

  #ゲストログイン用アクション
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to posts_path
  end
end