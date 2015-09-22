class ChangeNameFieldsForRegForm < ActiveRecord::Migration
  def change
    rename_column :reg_forms, :name, :firstname
    add_column :reg_forms, :lastname, :string
  end
end
