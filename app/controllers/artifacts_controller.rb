class ArtifactsController < ApplicationController
  # GET /artifacts
  # GET /artifacts.json
  before_filter :authenticate_user!

  helper_method :sort_column, :sort_direction

  def index
    @artifact = Artifact.new
    @search = Artifact.search do
      fulltext params[:search]
      paginate :page => params[:page], :per_page => 5
      order_by(sort_column, sort_direction)
    end
    @artifacts = @search.results
    #@artifacts = Artifact.order(sort_column + ' ' + sort_direction).paginate(:per_page => 5, :page => params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @artifacts }
      format.js
    end
  end

  # GET /artifacts/1
  # GET /artifacts/1.json
  def show
    @artifact = Artifact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @artifact }
      format.js
    end
  end

  # GET /artifacts/new
  # GET /artifacts/new.json
  def new
    @artifact = Artifact.new
    #@material = Material.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @artifact }
      format.js
    end
  end

  # GET /artifacts/1/edit
  def edit
    @artifact = Artifact.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  # POST /artifacts
  # POST /artifacts.json
  def create
    @artifact = Artifact.new(params[:artifact])

    if !@artifact.valid?
      flash[:error_created] = @artifact.errors.full_messages.join("<br>").html_safe
      redirect_to new_artifact_path
    else
      respond_to do |format|
        if @artifact.save
          format.html { redirect_to @artifact, notice: 'Artifact was successfully created.' }
          format.json { render json: @artifact, status: :created, location: @artifact }
          format.js
        else
          format.html { render action: "new" }
          format.json { render json: @artifact.errors, status: :unprocessable_entity }
          format.js
        end
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
        format.js
      else
        format.html { render action: "edit" }
        format.json { render json: @artifact.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /artifacts/1
  # DELETE /artifacts/1.json
  def destroy
    @artifact = Artifact.find(params[:id])
    @artifact.destroy

    respond_to do |format|
      format.html { redirect_to root_path, :notice => "Artifact was successfully delete." }
      format.json { head :no_content }
      format.js
    end
  end

  def delete_choose
    if params["artifacts_checkbox"].blank?
      flash[:error_delete] = "Please chooses !"
    else
      params["artifacts_checkbox"].each do |check|
        artifact_id = check
        artifact = Artifact.find_by_id(artifact_id)
        artifact.destroy
        flash[:notice] = "Artifact was successfully delete chooses!"
      end
    end
    redirect_to artifacts_path
  end

  private
  def sort_column
    Artifact.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
end
