class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    def index
        users = User.all
        render json: users
    end

    def show
        @user = User.find_by(id: session[:user_id])
        if user
            render json: user, only: [:id, :username, :password], serializer: PropertyAndUserSerializer, status: :ok
        else
            render json: {error: "Not authorized"}, status: :unauthorized
        end
    end

    def create
        user = User.create!(user_params)
        session[:user_id] = user.id
        render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        render json: user, status: :ok
    end

    private
    def user_params
        params.permit(:username, :email, :password, :password_confirmation)
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end

    def record_not_found
        render json: { error: "User not found" }, status: :not_found
    end
end
