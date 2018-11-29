class Dog < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  def active?
    self.active
  end

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end
end
