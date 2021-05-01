class V1::SessionsController < ApplicationController
    # def show
    #     current_user ? head(:ok) : head(:unauthorized)
    # end

    def create
        @user = User.where(email: params[:email]).first
        if @user&.valid_password?(params[:password])
            token = JWT.encode(
                @user.as_json,
                Rails.application.secrets.secret_key_base,
                'HS256'
            )
            render :create, status: :ok, locals: {token: token}
        else
            render json: {error: 'invalid_credentials'}, status: :unauthorized
        end
    end

    # def destroy
    #     current_user&.save
    #     head(:ok)
    #     # current_user&.authentication_token = nil
    #     # if current_user&.save
    #     #     head(:ok)
    #     # else
    #     #     head(:unauthorized)
    #     # end
    # end
end
