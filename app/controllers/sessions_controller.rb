class SessionsController < ApplicationController
    skip_before_action :authorize, only: [:create]

    def create
        user = User.find_by(email_address: params[:email_address])
        
        if user&.authenticate(params[:password])
            session[:user_token] = user.auth_token
            session[:org_token] = user.organization.auth_token

            render json: user, status: :created
        else
            render json: { errors: ["Invalid email or password"] }, status: :unauthorized
        end
    end

    def destroy 
        session.delete :user_token
        session.delete :org_token

        head :no_content
    end

end
