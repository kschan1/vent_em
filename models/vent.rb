class Vent < ActiveRecord::Base
  belongs_to :user
  belongs_to :vent_type
end
