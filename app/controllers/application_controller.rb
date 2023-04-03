class ApplicationController < ActionController::API
    include ActionController::Cookies
    before_action :authorize

    def authenticate_organization!
        # debugger
        # organization_auth_token = session.
    end

    private

    def authorize
        return render json: { error: ["Not authorized"] }, status: :unauthorized unless session.include? :org_token
    end
end 
