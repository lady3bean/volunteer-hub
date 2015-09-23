class AddVolunteerEmailToFollowUpForm < ActiveRecord::Migration
  def change
    add_column :follow_up_forms, :volunteer_email, :string
  end
end
