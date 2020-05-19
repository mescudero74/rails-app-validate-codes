class AddUsersToCodes < ActiveRecord::Migration[6.0]
  def change
    add_reference :codes, :user, null: false, foreign_key: true
  end
end
