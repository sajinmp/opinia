class Qna < ActiveRecord::Base

  valid_email_exp = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :mail, presence: true, format: { with: valid_email_exp }
  validates :ques, presence: true
end
