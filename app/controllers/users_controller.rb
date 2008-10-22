class UsersController < ApplicationController
  skip_before_filter :login_required
  layout :choose
  
  def choose
    if action_name == "show"
      'application'
    else
      'authentication'
    end
  end

  # render new.rhtml
  def new
    @user = User.new
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_user = @user # !! now logged in
      redirect_back_or_default(dashboard_path)
      flash[:notice] = "Thanks for signing up!  You're logged in, so enjoy using <strong>Estimette</strong>."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact us!"
      render :action => 'new'
    end
  end
  
  def show
    @user = current_user
  end
end
