require 'colorize'
class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  # GET /users
  def index
    @users = User.all
    render 'users/index.rabl'
  end

  # GET /users/:id
  def show
    @user = User.find(params[:id])
    render 'users/show.rabl'
  end

  # POST /users
  def create
    @user = User.new(user_params)
    puts user_params.to_s.colorize(:red)

    if @user.save
      render 'users/show.rabl', status: :created, location: @user
    else
      render json: { errors: @user.errors.full_messages.uniq }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1=:id
  def update
    if @user.update(user_params)
      render 'users/show.rabl', status: :ok, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
  
    render json: { message: "User was successfully destroyed." }, status: :no_content
  end

  private

  # Only allow a list of trusted parameters through.
  def user_params
    params.permit(:name, :email, :password)
  end

  # Override the default responder
  def default_render(*args)
    options = args.extract_options!
    super(options.merge(format: :json))
  end
end