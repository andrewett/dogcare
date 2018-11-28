class Dog < ApplicationRecord
  belongs_to :client
  mount_uploader :avatar, AvatarUploader

  def active?
    self.active
  end
end
