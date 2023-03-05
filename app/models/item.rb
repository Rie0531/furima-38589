class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postagetype
  belongs_to :prefecture
  belongs_to :preparationday

  belongs_to :user
  has_one :history
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :price,
              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              message: 'is out of setting range' }
    validates :explanation
    validates :image
    validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :postagetype_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :prefecture_id,  numericality: { other_than: 1, message: "can't be blank" }
    validates :preparationday_id, numericality: { other_than: 1, message: "can't be blank" }
  end
end
