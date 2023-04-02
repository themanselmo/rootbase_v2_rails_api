class SessionsController < ApplicationController
    skip_before_action :authorize, only: [:create]

    def create
        user = User.find_by(name: params[:email_address])
        
        if user&.authenticate(params[:password])
            session[:user_token] = user.auth_token
            
            render json: user, status: :created
        else
            render json: { errors: ["Invalid username or password"] }, status: :unauthorized
        end
    end

    def destroy 
        session.delete :user_token
        head :no_content
    end

end
