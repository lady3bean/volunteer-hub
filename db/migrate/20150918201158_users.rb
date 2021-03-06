class Users < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :username, null: false
      t.string :email, unique: true, null: false

      t.string :password_digest
      t.string :token
      
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at

      t.integer :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.timestamps null:false
    end
    add_index :users, :reset_password_token, unique: true
    add_index :users, :username, unique: true
    add_index :users, :token
  end
end
