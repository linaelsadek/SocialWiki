class Topic < ActiveRecord::Base
  has_many :comments
  validates :title, presence: true, length: {minimum: 5}
  validates :author, presence: true, length: {minimum: 3}
end
