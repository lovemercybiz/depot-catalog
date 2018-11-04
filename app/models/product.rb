class Product < ApplicationRecord
    validates :title, :description, :image_url, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 5} 
    validates :title, uniqueness: true
    validates :image_url, allow_blank: true, format: {
        with: %r{\.(gif|jpg|png|jpeg)\Z}i,# This regex matches . (. means anything?) followed by 3 options
        message: 'must be a GIF, JPG,JPEG, or PNG image file.'
    }
end

