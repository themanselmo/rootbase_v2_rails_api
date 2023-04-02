class User < ApplicationRecord
    belongs_to :organization
    
    has_secure_password
    has_secure_token :auth_token

end
