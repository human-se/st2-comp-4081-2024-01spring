# frozen_string_literal: true

require 'rails_helper'

RSpec.describe YogaPosesController, type: :controller do
  describe 'GET /yoga_poses' do
    it 'routes to index action' do
      expect(get: '/yoga_poses').to route_to('yoga_poses#index')
    end

    it 'has alias yoga_poses_path' do
      expect(yoga_poses_path).to eq '/yoga_poses'
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET /yoga_poses/new' do
    it 'routes to new action' do
      expect(get: '/yoga_poses/new').to route_to('yoga_poses#new')
    end

    it 'has alias new_yoga_pose_path' do
      expect(new_yoga_pose_path).to eq '/yoga_poses/new'
    end

    it 'renders the index template' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'POST /yoga_poses' do
    it 'routes to create action' do
      expect(post: '/yoga_poses').to route_to('yoga_poses#create')
    end

    context 'when name is blank' do
      it 'renders the page with error' do
        expect do
          post :create, params: { yoga_pose: { name: '', part_of_body: 'Hips', sanskrit: 'Padmasana' } }
        end.not_to change(YogaPose, :count)

        expect(response).to render_template(:new)
        expect(flash[:error]).to be_an_instance_of(String)
        expect(flash[:success]).to be_nil
      end
    end

    context 'when name is not blank' do
      it 'creates the record and redirects to index' do
        expect do
          post :create, params: { yoga_pose: { name: 'Lotus', part_of_body: 'Hips', sanskrit: 'Padmasana' } }
        end.to change(YogaPose, :count).by(1)

        expect(response).to redirect_to(yoga_poses_url)
        expect(flash[:error]).to be_nil
        expect(flash[:success]).to be_an_instance_of(String)
      end
    end
  end
end
