class Gif < ActiveRecord::Base
  acts_as_taggable

  scope :sorted, order(created_at: :desc)
end
