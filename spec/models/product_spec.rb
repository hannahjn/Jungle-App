require 'rails_helper'

  RSpec.describe Product, :type => :model do
    subject { Product.new }
    it "is valid with valid attributes" do 
      subject.name = "Anything"
      subject.price = 0
      subject.quantity = 8
      subject.category = Category.create(name: "shoes")
      expect(subject).to be_valid
    end
    describe 'Validations' do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:price) }
      it { is_expected.to validate_presence_of(:quantity) }
      it { is_expected.to validate_presence_of(:category) }
    end
  end


