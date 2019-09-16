require 'spec_helper'

RSpec.describe Image, type: :model do
  describe "Perfom an Image Transformation" do
    it "should validate One Pixel Transformation" do
      input = [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 1, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]

      expected = [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 1, 0, 0],
        [1, 1, 1, 0],
        [0, 1, 0, 0],
        [0, 0, 0, 0]
      ]
     image = Image.new(input)
     expect(image.blur).to eq expected
    end

    it "should validate Two Pixel Transformation" do
      input = [
        [0, 0, 0, 0],
        [0, 0, 1, 0],
        [0, 0, 0, 0],
        [0, 1, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]

      expected = [
        [0, 0, 1, 0],
        [0, 1, 1, 1],
        [0, 1, 1, 0],
        [1, 1, 1, 0],
        [0, 1, 0, 0],
        [0, 0, 0, 0]
      ]
     image = Image.new(input)
     expect(image.blur).to eq expected
    end

    it "should validate Pixel Edge Transformation" do
        input = [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [1, 0, 0, 0],
        [0, 0, 0, 0]
      ]

      expected = [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [1, 0, 0, 0],
        [1, 1, 0, 0],
        [1, 0, 0, 0]
      ]
     image = Image.new(input)
     expect(image.blur).to eq expected
    end
  end
end