class AddUserstoFollowUpForms < ActiveRecord::Migration
  def change
    add_reference :follow_up_forms, :user, index: true, foreign_key: true
  end
end
