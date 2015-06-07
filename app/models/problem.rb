class Problem < ActiveRecord::Base

  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :doubt, presence: true

end
