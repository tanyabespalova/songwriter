class Admin::AdminController < ActionController::Base
  layout 'admin'

  before_action :authenticate_user!
  before_action :admin_user!

  private

  def admin_user!
    unless current_user.admin?
      redirect_to new_user_session_path
    end
  end
end
