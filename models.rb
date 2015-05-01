 class User < ActiveRecord::Base
				has_many	:posts
				has_one	:profile


end

 class Profile < ActiveRecord::Base
 				belongs_to	:user


end

 class Post < ActiveRecord::Base
 				has_many :users
 				belongs_to	:user



end