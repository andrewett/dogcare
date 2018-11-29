class Dog < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  def active?
    self.active
  end
end
