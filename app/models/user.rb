class User < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  has_many :favorites
  validates :first_name, :presence => true
  validates :last_name,  :presence => true
  validates :email,      :presence => true
  validates :email,      :uniqueness => true
end
