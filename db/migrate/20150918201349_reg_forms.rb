class RegForms < ActiveRecord::Migration
  def change
    create_table :reg_forms do |t|
      t.string :name, null: false
      t.string :email, null: false, unique: true
      t.string :phone

      t.timestamps null: false
    end
  end
end
