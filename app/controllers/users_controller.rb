class UsersController < ApplicationController

    def show
        user = User.find_by(auth_token: session[:user_token])

        if user
            render json: user ,status: :ok
        else
            render json: {error: ["Not found"]}, status: :not_found
        end

    end

end
