class Forum < ActiveRecord::Base
  
  has_many :comments, dependent: :destroy
  
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :content, presence: true

end
