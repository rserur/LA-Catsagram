class Post < ActiveRecord::Base
  belongs_to :user, inverse_of: :posts
  mount_uploader :image, PostImageUploader

  validates :user, presence: true
  validates :image, presence: true
  validates :description, length: { maximum: 140 }

  def self.by_recency
    order(created_at: :desc)
  end

end
