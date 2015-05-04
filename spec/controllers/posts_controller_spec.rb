require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET #index' do
    it 'populates an array of posts' do
      post = create :post

      get :index

      expect(assigns(:posts)).to eq([post])
    end

    it 'renders successfully with an HTTP 200 Status Code' do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the index view' do
      get :index

      expect(response).to render_template('index')
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new post' do
        attrs = build(:post).attributes

        expect { post :create, post: attrs }.to change(Post, :count)
      end

      it 'redirects to the index' do
        post :create, post: build(:post).attributes

        expect(response).to redirect_to(posts_path)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new post object' do
        attrs = attributes_for(:post, header: nil)

        expect { post :create, post: attrs }.to_not change(Post, :count)
      end

      it 'renders the new view' do
        attrs = attributes_for(:post, header: nil)
        post :create, post: attrs

        expect(response).to render_template('new')
      end
    end
  end
end
