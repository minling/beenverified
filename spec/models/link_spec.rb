require 'rails_helper'

RSpec.describe Link, type: :model do 
  before do
    create :link, :facebook 
  end

  describe 'validations' do
    it { should validate_presence_of(:url) }
    it { should validate_uniqueness_of(:url) }
  end

  describe '#save' do
    it 'creates a short url' do
      link = create :link, :beenverified
      expect(link.short_url).to_not be_empty
    end
  end

  describe '#increment_access_count' do
    it 'should increment access count' do
      link = create :link, :beenverified
      link.increment_access_count
      expect(link.access_count).to equal(2)
    end
  end


end
