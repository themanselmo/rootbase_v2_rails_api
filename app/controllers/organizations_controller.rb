class OrganizationsController < ApplicationController
    skip_before_action :authorize, only: [:create]

    def create
        organization = Organization.create(org_params)   
        if organization.valid?
            owner = organization.users.create(user_params)
            
            if owner.valid?
            session[:org_token] = organization.auth_token

            render json: organization, status: :created
            else
                render json: {errors: owner.errors.full_messages}, status: :unprocessable_entity
            end
        else
            render json: {errors: organization.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def show
        organization = Organization.find_by(auth_token: session[:org_token])

        if organization
            render json: organization, status: :ok
        else
            render json: {error: ["Not found"]}, status: :not_found
        end

    end

    private

    def org_params
        params.permit(
            :name,
            :password
        )
    end

    def user_params
        params.permit(:first_name, :last_name, :email_address)
    end
end
