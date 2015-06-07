class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :votes, dependent: :destroy
  has_many :vote_options, through: :votes
  has_many :problems, dependent: :destroy
  has_many :comments, dependent: :destroy

  def voted_for?(poll)
    votes.any? { |v| v.vote_option.poll == poll }
  end

end
