class VoteableModelsController < ApplicationController
  # GET /voteable_models
  # GET /voteable_models.xml
  def index
    @voteable_models = VoteableModel.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @voteable_models }
    end
  end

  # GET /voteable_models/1
  # GET /voteable_models/1.xml
  def show
    @voteable_model = VoteableModel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @voteable_model }
    end
  end

  # GET /voteable_models/new
  # GET /voteable_models/new.xml
  def new
    @voteable_model = VoteableModel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @voteable_model }
    end
  end

  # GET /voteable_models/1/edit
  def edit
    @voteable_model = VoteableModel.find(params[:id])
  end

  # POST /voteable_models
  # POST /voteable_models.xml
  def create
    @voteable_model = VoteableModel.new(params[:voteable_model])

    respond_to do |format|
      if @voteable_model.save
        format.html { redirect_to(@voteable_model, :notice => 'Voteable model was successfully created.') }
        format.xml  { render :xml => @voteable_model, :status => :created, :location => @voteable_model }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @voteable_model.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /voteable_models/1
  # PUT /voteable_models/1.xml
  def update
    @voteable_model = VoteableModel.find(params[:id])

    respond_to do |format|
      if @voteable_model.update_attributes(params[:voteable_model])
        format.html { redirect_to(@voteable_model, :notice => 'Voteable model was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @voteable_model.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /voteable_models/1
  # DELETE /voteable_models/1.xml
  def destroy
    @voteable_model = VoteableModel.find(params[:id])
    @voteable_model.destroy

    respond_to do |format|
      format.html { redirect_to(voteable_models_url) }
      format.xml  { head :ok }
    end
  end
end
