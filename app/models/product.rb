class Product < ApplicationRecord
    has_many :line_items
    before_destroy  :ensure_not_referenced_by_any_line_item

    validates :title, :description, :image_url, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 5} 
    validates :title, uniqueness: true
    validates :image_url, allow_blank: true, format: {
        with: %r{\.(gif|jpg|png|jpeg)\Z}i,# This regex matches . (. means anything?) followed by 3 options
        message: 'must be a GIF, JPG,JPEG, or PNG image file.'
    }

    private
        #ensure that there are no line iterms referencing this product
        def ensure_not_referenced_by_any_line_item
            unless line_items.empty?
                errors.add(:base, 'Line Items present')
                throw :abort
            end
        end
        
end

