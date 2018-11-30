class Dog < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  def active?
    self.active
  end

  def boarding?
    self.boarding
  end

  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end
end
