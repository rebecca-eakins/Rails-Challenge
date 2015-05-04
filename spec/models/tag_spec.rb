require 'rails_helper'

RSpec.describe Tag, type: :model do
  subject { build(:tag) }

  it { is_expected.to be_valid }
  it { is_expected.to have_and_belong_to_many(:posts) }

  it 'is required to have a name' do
    expect(build(:tag, name: nil, short_name: nil)).to_not be_valid
  end

  it 'is required to have a name between 5 and 50 characters long' do
    expect(build(:tag, name: 'x' *   4)).to_not be_valid
    expect(build(:tag, name: 'x' *  10)).to be_valid
    expect(build(:tag, name: 'x' * 100)).to_not be_valid
  end

  it 'sets the short name before being saved' do
    tag = build(:tag, name: 'this is a tag name')

    expect(tag).to receive(:short_name).and_return('this-is-my-tag-name')
    tag.save!
  end

  context '.create_short_name' do
    it 'converts the full name to a parameterized short name and sets it' do
      a = build(:tag, name: 'this is a tag name')
      expect(a.short_name).to eq('')
      a.create_short_name
      expect(a.short_name).to eq('this-is-a-tag-name')
    end
  end
end
