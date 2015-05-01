class CreateUsersTable < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string  :username
  		t.integer  :user_id
  		
  	end
  end
end
