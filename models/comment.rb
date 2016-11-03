
class Comment < ActiveRecord::Base
  validates :body, length: { minimum: 2 }
  belongs_to :vent
  belongs_to :user
end
