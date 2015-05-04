require 'rails_helper'

RSpec.describe Author, type: :model do
  subject { build(:author) }

  it { is_expected.to be_valid }
  it { is_expected.to have_many(:posts) }

  it 'is required to have a first name' do
    expect(build(:author, first_name: nil)).to_not be_valid
  end

  it 'is required to have a last name' do
    expect(build(:author, last_name: nil)).to_not be_valid
  end

  it 'is required to have an email address' do
    expect(build(:author, email_address: nil)).to_not be_valid
  end

  it 'is required to have an valid email address' do
    expect(build(:author, email_address: '123@dsa')).to_not be_valid
    expect(build(:author, email_address: Faker::Internet.email)).to be_valid
  end
end
