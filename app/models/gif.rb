class Gif < ActiveRecord::Base
  acts_as_taggable

  scope :sorted, ->{ order(created_at: :desc) }
  scope :untagged, ->{ includes(:taggings).where("taggings.id" => nil) }
end
