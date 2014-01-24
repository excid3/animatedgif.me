class Gif < ActiveRecord::Base
  acts_as_taggable
  belongs_to :user

  scope :sorted, ->{ order(created_at: :desc) }
  scope :untagged, ->{ includes(:taggings).where("taggings.id" => nil) }

  def next
    self.class.where("id > ?", id).order("id ASC").first
  end

  def prev
    self.class.where("id < ?", id).order("id DESC").first
  end
end
