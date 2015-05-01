class CreatePostsTable < ActiveRecord::Migration
  def change
  	create_table :posts do |t|
  		t.string  :title
  		t.string  :body
  		t.integer  :user_id
  		t.datetime	:created_at
  		t.datetime	:updated_at
  		
  	end
  end
end
