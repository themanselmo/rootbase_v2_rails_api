class CreateOrganizations < ActiveRecord::Migration[7.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :password_digest
      t.string :auth_token

      t.timestamps
    end
  end
end
