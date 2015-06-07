class Comment < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :forum
  
  validates :reply, presence: true
  validates :user_id, presence: true
  validates :forum_id, presence: true

end
