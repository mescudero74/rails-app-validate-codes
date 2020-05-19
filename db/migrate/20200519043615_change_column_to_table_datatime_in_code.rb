class ChangeColumnToTableDatatimeInCode < ActiveRecord::Migration[6.0]
  def change
    change_column :codes, :registration_datetime, :string
  end
end
