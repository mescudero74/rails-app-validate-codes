class CreateCodes < ActiveRecord::Migration[6.0]
  def change
    create_table :codes do |t|
      t.datetime :registration_datetime
      t.integer :amount
      t.string :email
      t.string :code
      t.string :status

      t.timestamps
    end
  end
end
