class V1::UsersController < ApplicationController
  def index
    render json: User.all, status: :ok
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render :create, status: :created
    else
      head(:unprocessable_entity)
    end
  end

  def destroy
    if User.destroy(params[:id])
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  # def update
  #   user = User.where(id: params[:id])
  #   if user
  #     render json: user.to_json, status: :ok
  #   else
  #     head(:not_found)
  #   end
  # end

  def show
    user = User.where(id: params[:id])
    if user
      render json: user.to_json, status: :ok
    else
      head(:not_found)
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
