require 'spec_helper'

describe FavoritesController do
  let(:user_attrs)     { { :format => :json, :user => attributes_for(:user) } }
  let(:favorite_attrs)     { { :format => :json, :favorite => attributes_for(:favorite) } }
  let(:bad_favorite_attrs) { { :format => :json, :favorite => { :user_id => nil } } }

  subject              { response }

  describe "GET 'index'" do
    let!(:user)      { create :user }
    before(:each) { get :index, :user_id => user.id , :format => :json }

    its(:body)   { should_not be_empty }
    its(:status) { should be 200}
  end

  # describe "POST 'create'" do
  #   let!(:user)      { create :user }
  #   before(:each) { post :create, :user_id => user.id, favorite_attrs }

  #   its(:body)    { should_not be_empty }
  #   its(:status)  { should be 201 }
  #   its(:headers) { should include "Location" }

  #   context "with bad params" do
  #     let!(:user)      { create :user }
  #     before(:each) { post :create, bad_favorite_attrs, :user_id => user.id  }

  #     its(:body)    { should_not be_empty }
  #     its(:status)  { should be 422 }
  #   end
  # end
  context "existing favorite" do
    let!(:favorite)      { create :favorite }
    let!(:user)      { create :user }
    let(:favorite_attrs) { { :id =>favorite.id, :format => :json, :favorite => { :user=> user, :cut=> 1 } } }

    describe "GET 'show'" do
      let!(:favorite)      { create :favorite }
      before(:each) { get :show, :id => favorite.id, :format => :json }

      its("body.strip")    { should_not be_empty }
      its(:status)  { should be 200}

      context "with an unknown favorite" do
        before(:each) { get :show, :id => 9999, :format => :json }

        its("body.strip") { should be_empty }
        its(:status)      { should be 404 }
      end
    end
  end
    # describe "PUT 'update'" do
    #   let!(:user)      { create :user }
    #   before(:each) { put :update, favorite_attrs }

    #   its("body.strip") { should be_empty }
    #   its(:status)      { should be 204 }

    #   it "updates the user" do
    #     Favorite.find(favorite.id).user_id.should eq user_attrs[:user][:id]
    #   end

    #   context "with bad params" do
    #     before(:each) { put :update, { :id => favorite.id, :user => { :user_id => nil, cut_id => 1 }, :format => :json } }

    #     its(:body)    { should_not be_empty }
    #     its(:status)  { should be 422 }
    #   end
    # end

    describe "DELETE 'destroy'" do
      let!(:favorite)      { create :favorite }

      before(:each) { delete :destroy, :id => favorite.id, :format => :json }

      its("body.strip") { should be_empty }
      its(:status)      { should be 204 }
    end
  # end
end
