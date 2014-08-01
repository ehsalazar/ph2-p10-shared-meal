require 'spec_helper'

describe 'GET /users/all' do

  it "should display all users" do
    User.destroy_all
    User.create(name: 'James', email: 'james@email.com', password_hash: '123456')
    get '/users'
    expect(User.count).to eq(1)
  end

end

describe 'POST /users' do

  before :each do
    User.destroy_all
  end

  context "when the request has valid paramters" do

    before :each do
      User.create(name: 'James', email: 'james@email.com', password_hash: '123456')
      post '/users'
    end

    it "creates a new user" do
      expect(User.count).to eq(1)
    end

    it "redirects the user to the /users/:id route" do
      expect(last_response.location).to include('/users/:id')
    end

  end

  context "when the request does not include a password greater than 6 characters" do

    before :each do
      User.create(name: 'James', email: 'james@email.com', password_hash: '1')
      post '/users'
    end

    it "does not create a new user" do
      expect(User.count).to eq(0)
    end

  end

  context "when the request does not include a unique email" do

    before :each do
      User.create(name: 'James', email: 'james@email.com', password_hash: '123456')
      post '/users'
    end

    it "does not create a new User" do
      expect(User.count).to eq(1)
    end

  end

end

describe 'GET /meals' do

  before :each do
    Meal.destroy_all
    User.destroy_all
  end

  context "when a user is not logged in" do

    it "doesn't displays all meals" do
      Meal.create(location: 'Chipotle')
      get '/'
      expect(last_response.body).not_to include('Chipotle')
    end

  end

  context "when a user is logged in" do

    before :each do
      jack = User.create(name: 'Jack', email: 'jack@email.com', password_hash: '123456')
      jack.meals << Meal.create(location: 'Melt')
      session = {'rack.session' => {user_id: jack.id}}
      get '/', {}, session
    end

    it "displays all of the given user's meals" do
      expect(last_response.body).to include('Melt')
    end

    it "displays all meals" do
      Meal.create(location: 'Super Duper')
      expect(last_response.body).not_to include('Super Duper')
    end

  end
end
