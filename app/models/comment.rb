class Comment < ActiveRecord::Base
  belongs_to :topic
  has_many :votes, dependent: :destroy
end
