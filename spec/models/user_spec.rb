require "rails_helper"

RSpec.describe User, :type => :model do

	it "shouldn't be valid bacause email is nil" do
	  lindeman = User.new(name: "Andy")
	  expect(lindeman).to be_invalid
	end

	it "shouldn't be valid bacause email is not valid" do
	  lindeman = User.new(name: "Andy", :email_id => 'aaa@aaa')
	  expect(lindeman).to be_invalid
	end

	it "shouldn be valid" do
	  lindeman = User.new(name: "Andy", :email_id => 'aaa@aaa.com')
	  expect(lindeman).to be_valid
	end

  it "user name" do
    lindeman = User.create!(name: "Andy", email_id: "Lindeman@gmail.com")
    chelimsky = User.create!(name: "David",email_id: "Chelimsky@gmail.com")

    expect(User.all.count).to eq(2)
  end
end