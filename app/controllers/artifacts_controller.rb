class ArtifactsController < ApplicationController
  # GET /artifacts
  # GET /artifacts.json
  before_filter :authenticate_user!
  def index
    @artifacts = Artifact.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @artifacts }
    end
  end

  # GET /artifacts/1
  # GET /artifacts/1.json
  def show
    @artifact = Artifact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @artifact }
    end
  end

  # GET /artifacts/new
  # GET /artifacts/new.json
  def new
    @artifact = Artifact.new
    @material = Material.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @artifact }
    end
  end

  # GET /artifacts/1/edit
  def edit
    @artifact = Artifact.find(params[:id])
  end

  # POST /artifacts
  # POST /artifacts.json
  def create
    @artifact = Artifact.new(params[:artifact])
   # @material =Material.all

<<<<<<< HEAD
if (params[:name] ==nil || params[:dating] ==nil || params[:description] ==nil || params[:code ]==nil ||  params[:language] ==nil || params[:gallery_id] ==nil)
   render action: "new" 
else
    respond_to do |format|
      if @artifact.save  
        format.html { redirect_to @artifact, notice: 'Artifact was successfully created.' }
        format.json { render json: @artifact, status: :created, location: @artifact }
      else
        format.html { render action: "new" }
        format.json { render json: @artifact.errors, status: :unprocessable_entity }
      end
=======
    if !@artifact.valid?
      flash[:error_created] = @artifact.errors.full_messages.join("<br>").html_safe
      redirect_to new_artifact_path
    else
      respond_to do |format|
        if @artifact.save
          format.html { redirect_to @artifact, notice: 'Artifact was successfully created.' }
          format.json { render json: @artifact, status: :created, location: @artifact }
        else
          format.html { render action: "new" }
          format.json { render json: @artifact.errors, status: :unprocessable_entity }
        end
      end  
>>>>>>> 1eb7c2c67bc736d93f092805f4491d08fc8d9648
    end
end
  end

  # PUT /artifacts/1
  # PUT /artifacts/1.json
  def update
    @artifact = Artifact.find(params[:id])

    respond_to do |format|
      if @artifact.update_attributes(params[:artifact])
        format.html { redirect_to @artifact, notice: 'Artifact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @artifact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artifacts/1
  # DELETE /artifacts/1.json
  def destroy
    @artifact = Artifact.find(params[:id])
    @artifact.destroy

    respond_to do |format|
      format.html { redirect_to artifacts_url }
      format.json { head :no_content }
    end
  end
end
