require 'rails_helper'

describe ProjectsController do
  let(:valid_attributes) { attributes_for(:project) }
  let!(:project) { create(:project) }

  describe "GET index" do
    it "exposes all projects" do
      task = create(:task, project: project)
      get :index
      expect(assigns(:projects)).to eq([project])
    end
  end

  describe 'POST create' do
    it 'creates a new Project' do
      expect {
        post :create, { project: valid_attributes }
      }.to change(Project, :count).by(1)
    end

    it 'exposes a newly created project as #project' do
      post :create, { project: valid_attributes }
      expect(assigns(:project)).to be_an_instance_of(Project)
      expect(assigns(:project)).to be_persisted
    end
  end

  describe 'PUT update' do
    it 'updates the requested project' do
      attributes = valid_attributes.stringify_keys.transform_values { |x| x.to_s }
      allow_any_instance_of(Project).to receive(:update).with(attributes)
      put :update, id: project.to_param, project: attributes, format: 'js'
    end

    it 'exposes the requested project' do
      put :update, id: project.to_param, project: valid_attributes, format: 'js'
      expect(assigns(:project)).to eq(project)
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested project' do
      expect {
        delete :destroy, :id => project.to_param, format: 'js'
      }.to change(Project, :count).by(-1)
    end
  end
end
