class Organization < ApplicationRecord
    has_many :users, dependent: :destroy
    has_one :owner, -> { where role: 'owner' }, class_name: 'User'
    
    has_secure_token :auth_token

    def initialize_owner(user_params)
        # create main user, defined by the attribute role: 'owner'
        users.create(**user_params, role: 'owner')
    end

end
