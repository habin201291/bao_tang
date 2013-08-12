class ProfilesController < ApplicationController
  
  before_filter :get_user, :only => [:show, :create, :new, :edit, :update]
  before_filter :authenticate_user!
  def get_user
    current_user = User.find(params[:user_id])
  end

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profiles }
    end
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @profile = current_user.profile

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /profiles/new
  # GET /profiles/new.json
  def new
    @profile = Profile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /profiles/1/edit
  def edit
    @profile = current_user.profile
  end

  # POST /profiles
  # POST /profiles.json
  def create
    current_user.profile = Profile.new(params[:profile])
    @profile = current_user.profile

    if !@profile.valid?
      flash[:error_created] = @profile.errors.full_messages.join("<br>").html_safe
      redirect_to new_user_profile_path(current_user)
    else
      respond_to do |format|
        if @profile.save
          format.html { redirect_to user_profile_path(current_user), notice: 'Profile was successfully created.' }
          format.json { render json: @profile, status: :created, location: @profile }
        else
          format.html { render action: "new" }
          format.json { render json: @profile.errors, status: :unprocessable_entity }
        end
      end  
    end
  end

  # PUT /profiles/1
  # PUT /profiles/1.json
  def update
    @profile = current_user.profile

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to (user_profile_path(current_user)), notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_path, :notice => "profile was successfully delete." }
      format.json { head :no_content }
    end
  end

  def delete_choose
    if params["profiles_checkbox"].blank?
      flash[:error_delete] = "Please chooses !"
    else
      params["profiles_checkbox"].each do |check|
        profile_id = check
        profile = Profile.find_by_id(profile_id)
        profile.destroy
        flash[:notice] = "Profile was successfully delete chooses!"
      end
    end
    redirect_to profiles_path
  end
end
