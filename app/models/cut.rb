class Cut < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  validates :name, :presence => true
  belongs_to :animal
  belongs_to :primal_cut
end
