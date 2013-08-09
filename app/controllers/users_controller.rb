class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    if !@user.valid?
      flash[:error_created] = @user.errors.full_messages.join("<br>").html_safe
      redirect_to new_user_path
    else
      respond_to do |format|
        if @user.save
          format.html { redirect_to new_user_profile_path, notice: 'User was successfully created.' }
          format.json { render json: @user, status: :created, location: @user }
        else
          format.html { render action: "new" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end  
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to user_path(@user), notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_path, :notice => "User was successfully delete." }
      format.json { head :no_content }
    end
  end

  def delete_choose
    if params["users_checkbox"].blank?
      flash[:error_delete] = "Please chooses !"
    else
      params["users_checkbox"].each do |check|
        user_id = check
        user = User.find_by_id(user_id)
        user.destroy
        flash[:notice] = "User was successfully delete chooses!"
      end
    end
    redirect_to users_path
  end

  def update_avatar
    @current_user = User.find_by_id(current_user.id)
    respond_to do |format|
      if @current_user.update_attributes(params[:current_user])
        format.html { redirect_to user_profile_path(current_user), notice: 'Your avatar was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to user_profile_path(current_user) }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
