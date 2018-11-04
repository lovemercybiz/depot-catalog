require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
        # assert product.errors[:].any?
  end

  test "product price must be positive" do
    product = Product.new(title: "My book Title", description: "blah blah blah", image_url: "Oleg-Magni-pexels.jpeg")
    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 5"],
      product.errors[:price]
    
    product.price = 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 5"],
      product.errors[:price]

    product.price = 8
    assert product.valid?

  end

  def new_product(image_url)
    Product.new(title: "My book Title", description: "Blah Blah Blah", price: "204", image_url: image_url)
  end

  test "image_url" do 
    ok = %w{ fred.gif fred.jpg fred.jpeg fred.png FRED.JPG FRED.Jpg FRED.JPEG FRED.Jpeg http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }
     
    ok.each do |image_url|
      assert new_product(image_url).valid?,
            "#{image_url} shouldn't be valid"
    end
    bad.each do |image_url|
      assert new_product(image_url).invalid?,
            "#{image_url} shouldn't be valid"  
    end
  end

  test "product is not valid without a unique title" do
    product = Product.new(title: products(:ruby).title, description: "Blah Blah Blah", price: "4", image_url: "Oleg-Magni-pexels.jpeg")
    assert product.invalid?
    assert_equal ["has already been taken"], product.errors[:title]
  end #hard coded

  test "product is not valid without a unique title - i18n" do
    product = Product.new(title: products(:ruby).title, description: "Blah Blah Blah", price: "4", image_url: "Oleg-Magni-pexels.jpeg")
    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')],
                  product.errors[:title]
  end #not hard coded

end
