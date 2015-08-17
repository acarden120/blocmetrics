require 'rails_helper'

describe 'Valid Registered Application' do
  it 'has a valid factory' do
    FactoryGirl.create(:registered_application).should be_valid
  end

  it 'is invalid without a name' do
    FactoryGirl.build(:registered_application, name: nil).should_not be_valid
  end

  it 'is invalid without a url' do
    FactoryGirl.build(:registered_application, url: nil).should_not be_valid
  end
end
