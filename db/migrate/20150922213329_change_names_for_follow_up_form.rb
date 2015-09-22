class ChangeNamesForFollowUpForm < ActiveRecord::Migration
  def change
    rename_column :follow_up_forms, :name, :firstname
    add_column :follow_up_forms, :lastname, :string
  end
end
