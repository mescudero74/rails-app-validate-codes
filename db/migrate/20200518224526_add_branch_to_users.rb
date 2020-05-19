class AddBranchToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :branch, :string
  end
end
