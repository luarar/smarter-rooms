module UsersHelper
    def is_admin?
        self.admin 
    end
    
  def authorize
    unless current_user.is_admin
      flash[:error] = "unauthorized access"
      redirect_to root_path
      false
    end
  end
end
