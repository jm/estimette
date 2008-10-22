require 'md5'

module ApplicationHelper
  
  # Sets the page title and outputs title if container is passed in.
  # eg. <%= title('Hello World', :h2) %> will return the following:
  # <h2>Hello World</h2> as well as setting the page title.
  def title(str, container = nil)
    @page_title = str
    content_tag(container, str, :id => 'page-title') if container
  end
  
  # Outputs the corresponding flash message if any are set
  def flash_messages
    messages = []
    %w(notice warning error).each do |msg|
      messages << content_tag(:div, flash[msg.to_sym], :id => "flash-#{msg}") unless flash[msg.to_sym].blank?
    end
    messages
  end
  
  def menu
    obj = Menu.new(self)
    yield obj
    
    content_for :menu do
      "<div class='page-menu'>
        <p>
        #{obj.to_html}
        </p>
      </div>
      "
    end
  end
  
  class Menu
    def initialize(helper)
      @helper = helper
    end
    
    def item(text, link)
      @items ||= []
      @items << [text, link]
    end
    
    def to_html
      @items.map {|i| @helper.link_to(i[0], i[1], :class => "nav-link") }.join("| \n")
    end
  end
  
  def user_display(user=current_user)
    "
    <div id='user-display'>
      <img src='#{gravatar_image(user.email)}'> 
      <span class='name'>#{user.name} (#{user.login})</span><br />
      <span class='info'>#{pluralize user.projects.size, 'project'}, #{pluralize user.features.size, 'estimate'}, #{current_user.accuracy}% accuracy</span>
    </div>
    "
  end
  
  def gravatar_image(email)
    "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}?s=40"
  end
  
  def dashboard_menu
    @selected = :dashboard
    
    menu do |m|
      m.item "Home", dashboard_path
      m.item "Per-project", projects_path
    end
  end
  
  def features_menu
    @selected = :estimates
    
    menu do |m|
      m.item "New estimate", new_feature_path
      m.item "View list", features_path
      m.item "Incomplete", incomplete_features_path
      m.item "Completed", completed_features_path
    end
  end
  
  def projects_menu
    @selected = :projects
    
    menu do |m|
      m.item "New project", new_project_path
      m.item "View list", projects_path
    end
  end
  
  def account_menu
    @selected = :account
    
    menu do |m|
      m.item "View account", user_path(current_user)
    end
  end
  
  def projects_select_options
    projects = [['(no project)', '']]
    projects += current_user.projects.map {|p| [p.name, p.id]}
    projects
  end

  def empty_message(text = "No results!")
    "<div class='empty'>#{text}</div>"
  end
  
end
