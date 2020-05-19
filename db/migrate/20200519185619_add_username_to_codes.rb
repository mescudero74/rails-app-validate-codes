class AddUsernameToCodes < ActiveRecord::Migration[6.0]
  def change
    add_column :codes, :username, :string
  end
end
