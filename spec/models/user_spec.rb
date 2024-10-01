require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#validate" do 
    it 'should be valid' do 
      user = build :user 
      expect(user).to be_valid
    end

    it 'should validate presence of attributes' do 
      user = build :user, login: '', name: ''
      expect(user).not_to be_valid
      expect(user.errors.messages[:name]).to include("can't be blank")
      expect(user.errors.messages[:login]).to include("can't be blank")
    end

    it 'should validate uniqueness login' do 
      user = create :user
      other_user = build :user, login: user.login
      expect(other_user).not_to be_valid
      other_user = build :user 
      expect(other_user).to be_valid 
    end
  end
end
