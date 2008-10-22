class NotesController < ApplicationController
  def create
    @note = Note.new(params[:note])

    respond_to do |format|
      if @note.save
        flash[:notice] = 'Note was successfully created.'
        format.html { redirect_to(@note.feature) }
        format.xml  { render :xml  => @note, :status => :created, :location => @note }
        format.json { render :json => @note, :status => :created, :location => @note }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml  => @note.errors, :status => :unprocessable_entity }
        format.json { render :json => @note.errors, :status => :unprocessable_entity }
      end
    end
  end
end
