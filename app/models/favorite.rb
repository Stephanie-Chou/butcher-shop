class Favorite < ActiveRecord::Base

  attr_accessible :cut_id, :user_id

  validates :user_id, :presence => true
  validates :cut_id,  :presence => true

  belongs_to :user
  belongs_to :cut
end
