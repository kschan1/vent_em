class Vent < ActiveRecord::Base
  validates :body, length: { minimum: 2 }
  belongs_to :user
  belongs_to :vent_type
end
