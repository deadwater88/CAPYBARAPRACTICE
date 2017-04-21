require 'rails_helper'
require 'spec_helper'

RSpec.describe UsersController, type: :controller do

  # describe "GET #index" do
  #   it "returns http success" do
  #     get :index
  #     expect(response).to have_http_status(:success)
  #     expect(response).to render_template(:index)
  #   end
  # end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    it "redirects to user page on success" do
      post :create, params: {user: { username: 'jim', password: 'password' }}
      expect(response).to redirect_to(user_url(User.find_by(username: 'jim')))
    end

    it "redirects to \'new user\' template on failure" do
      post :create, params: {user: { username: 'Lea'}}
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response).to render_template(:new)
    end
  end

  describe "GET #show" do
    subject!(:user){User.create(username: 'phil', password: 'password')}
    context 'with valid id' do
      it "returns http success" do
        get :show, params: {id: user.id}
        expect(response).to render_template(:show)
      end
    end
    context 'with invalid id' do
      it "responds with not found" do
        get :show, params: {id: -5}
        expect(response).to_not render_template(:show)
        expect(response).to have_http_status(:not_found)
      end
    end
  end

end
