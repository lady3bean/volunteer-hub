class CreateFollowUpForms < ActiveRecord::Migration
  def change
    create_table :follow_up_forms do |t|
      t.string :name, null: false
      t.string :email, null: false, unique: true
      t.string :phone
      t.boolean :want_to_volunteer
      t.boolean :subscribe_to_sms

      t.timestamps null: false
    end
  end
end