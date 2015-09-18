class AddUsersToRegForms < ActiveRecord::Migration
  def change
    add_reference :reg_forms, :user, index: true, foreign_key: true
  end
end