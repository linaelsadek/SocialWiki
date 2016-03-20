class Comment < ActiveRecord::Base
  belongs_to :topic
  has_many :votes, dependent: :destroy
  validates :author, presence: true, length: {minimum: 3}
  validates :text, presence: true, length: {minimum: 10}

end
