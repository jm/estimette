class PagesController < ApplicationController
  skip_before_filter :login_required, :only => [:index]
  layout :choose
  
  def choose
    if action_name == 'index'
      'front'
    else
      'application'
    end
  end
  
  def index
  end
  
  def dashboard
    @projects = current_user.projects.find(:all, :order => 'id ASC')
    
    @accurate = current_user.features.accurate.find(:all)
    @inaccurate = current_user.features.inaccurate.find(:all)
    @incomplete = current_user.features.incomplete.find(:all)
  end

  def help
  end

  def about
  end
end
