class FeaturesController < ApplicationController
  def index
    @features ||= current_user.features.find(:all)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml  => @features }
      format.json { render :json => @features }
    end
  end
  
  def incomplete
    @features = current_user.features.incomplete.find(:all)
    @title = "Incomplete estimates"
    @blank = "No estimates completed yet."
    
    render :template => 'features/index'
  end
  
  def completed
    @features = current_user.features.completed.find(:all)
    @title = "Completed estimates"
    @blank = "No estimates or all estimates completed."
    
    render :template => 'features/index'
  end

  def show
    @feature = current_user.features.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml  => @feature }
      format.json { render :json => @feature }
    end
  end

  def new
    @feature = current_user.features.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml  => @feature }
      format.json { render :json => @feature }
    end
  end

  def create
    @feature = current_user.features.build(params[:feature])

    respond_to do |format|
      if @feature.save
        flash[:notice] = 'Feature was successfully created.'
        format.html { redirect_to(@feature) }
        format.xml  { render :xml  => @feature, :status => :created, :location => @feature }
        format.json { render :json => @feature, :status => :created, :location => @feature }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml  => @feature.errors, :status => :unprocessable_entity }
        format.json { render :json => @feature.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @feature = current_user.features.find(params[:id])
  end

  def update
    @feature = current_user.features.find(params[:id])

    respond_to do |format|
      if @feature.update_attributes(params[:feature])
        format.html do
          flash[:notice] = 'Feature was successfully updated.'
          
          redirect_to(@feature)
        end
        
        format.xml  { head :ok }
        format.js do
          @feature.write_attribute(params[:editorId].to_sym, params[:value])
          if @feature.save
            render :text => @feature.attributes[params[:editorId]]
          else
            txt = "#{@feature.attributes[params[:editorId]]} <script>alert('There was a problem saving this estimate!');</script>"
            render :text => txt
          end
        end
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml  => @feature.errors, :status => :unprocessable_entity }
        format.js { render :json => @feature.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @feature = current_user.features.find(params[:id])
    @feature.destroy

    respond_to do |format|
      format.html { redirect_to(features_url) }
      format.xml  { head :ok }
      format.json { head :ok }
    end
  end
end
