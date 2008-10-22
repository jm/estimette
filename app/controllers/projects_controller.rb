class ProjectsController < ApplicationController
  def index
    @projects = current_user.projects.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml  => @projects }
      format.json { render :json => @projects }
    end
  end

  def show
    @project = current_user.projects.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml  => @project }
      format.json { render :json => @project }
    end
  end

  def new
    @project = current_user.projects.build
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml  => @project }
      format.json { render :json => @project }
    end
  end

  def create
    @project = current_user.projects.build(params[:project])

    respond_to do |format|
      if @project.save
        flash[:notice] = 'Project was successfully created.'
        format.html { redirect_to(@project) }
        format.xml  { render :xml  => @project, :status => :created, :location => @project }
        format.json { render :json => @project, :status => :created, :location => @project }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml  => @project.errors, :status => :unprocessable_entity }
        format.json { render :json => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @project = current_user.projects.find(params[:id])
  end

  def update
    @project = current_user.projects.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        flash[:notice] = 'Project was successfully updated.'
        format.html { redirect_to(@project) }
        format.xml  { head :ok }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml  => @project.errors, :status => :unprocessable_entity }
        format.json { render :json => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @project = current_user.projects.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to(projects_url) }
      format.xml  { head :ok }
      format.json { head :ok }
    end
  end
end
