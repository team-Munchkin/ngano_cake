class Item < ApplicationRecord


  has_one_attached :image

 # has_many :oder_items, dependent: :destroy
 # belongs_to :genre

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :is_active, inclusion: { in: [true, false] }
  validates :image,presence: true

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def taxin_price
    (price*1.10).round
  end



end
