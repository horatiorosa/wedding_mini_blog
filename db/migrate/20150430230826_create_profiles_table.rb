class CreateProfilesTable < ActiveRecord::Migration
  def change
  	create_table	:profiles do |t|
  		t.string	:fname
  		t.string	:lname
  		t.string	:email
  		t.string	:password

  	end

  end
end
