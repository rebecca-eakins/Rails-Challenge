require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { build(:post) }

  it { is_expected.to be_valid }
  it { is_expected.to have_and_belong_to_many(:tags) }
  it { is_expected.to belong_to(:author) }

  it 'is required to have a header' do
    expect(build(:post, header: nil)).to_not be_valid
  end

  it 'is required to have a body' do
    expect(build(:post, body: nil)).to_not be_valid
  end

  it 'is required to have an author' do
    expect(build(:post, author: nil)).to_not be_valid
  end

  it 'is required to have a header between 5 and 50 characters long' do
    expect(build(:post, header: 'x' *   4)).to_not be_valid
    expect(build(:post, header: 'x' *  10)).to be_valid
    expect(build(:post, header: 'x' * 100)).to_not be_valid
  end

  it 'is required to have a body between 50 and 2500 characters long' do
    expect(build(:post, body: 'x' *   25)).to_not be_valid
    expect(build(:post, body: 'x' *  100)).to be_valid
    expect(build(:post, body: 'x' * 3000)).to_not be_valid
  end
end
