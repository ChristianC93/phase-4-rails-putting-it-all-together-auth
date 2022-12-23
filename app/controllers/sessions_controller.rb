class SessionsController < ApplicationController

    def create
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: { errors: ["Not Authorized"] }, status: :unauthorized
        end
    end

    def destroy
        if session[:user_id]
            session.delete :user_id
            render json: {}, status: :no_content
        else
            render json: { errors: ["Not Authorized"] }, status: :unauthorized
        end
    end
end
