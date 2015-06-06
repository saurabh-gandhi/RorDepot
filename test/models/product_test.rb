require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
	test "product attributes must not be empty" do
		product = Product.new
		assert product.invalid?
		assert product.errors[:title].any?
		assert product.errors[:description].any?
		assert product.errors[:price].any?
		assert product.errors[:image_url].any?
	end
	test "product price must be greater that 0.01" do
		product = product.new{title: "new title", description: "abcas" , image_url: "abc.png"}
		product.price = -1
		product.invalid?
		assert_equal "must be greater than or equal to 0.01",
			product.errors[:price].join('; ')
		product.price = 0
                product.invalid?
                assert_equal "must be greater than or equal to 0.01",
                        product.errors[:price].join('; ')
		product.price = 1
                product.valid?
	end
