require 'rails_helper'

RSpec.describe User, type: :model do
#   subject { User.new }
#   it "is valid with valid attributes" do 
#     subject.password = "Anything"
#     subject.password_confirmation = subject.password
#     expect(subject).to be_valid

# end
describe 'Validations' do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:password_confirmation) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:password) }
  it { should validate_length_of(:password).is_at_least(1) }
  it { should validate_uniqueness_of(:email) }
end
describe 'on a new user' do
  it 'should not be valid with a confirmation mismatch' do
    user = User.new password: 'short', password_confirmation: 'long'
    user.should_not be_valid
  end
end

describe '.authenticate_with_credentials' do 
  it { is_expected.to be_truthy }
end
end
