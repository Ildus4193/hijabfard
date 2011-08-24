class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :login
      t.string :name
      t.string :last_name
      t.string :city
      t.string :adress
      t.integer :phone
      t.string :email
      
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable

      t.timestamps
    end
    
    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    
  end

  def self.down
    drop_table :users
  end
end
