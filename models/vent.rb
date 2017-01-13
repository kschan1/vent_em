class Vent < ActiveRecord::Base
  validates :body, length: { minimum: 2 }
  belongs_to :user
  belongs_to :vent_type
  has_many :comments, dependent: :destroy
  has_many :agrees
  has_many :disagrees
end
