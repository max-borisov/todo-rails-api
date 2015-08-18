require 'rails_helper'

describe ProjectsController do
  let(:valid_attributes) { attributes_for(:project) }

  describe "GET index" do
    let(:json) { JSON.parse(response.body) }

    before do
      @project_1 = create(:project)
      @project_2 = create(:project)
      @task = create(:task, project_id: @project_2.id)
    end

    it "exposes all projects" do
      get :index
      expect(assigns(:projects)).to eq([@project_1, @project_2])
    end
  end

  describe 'POST create' do
    it 'creates a new Project' do
      expect { post :create, project: valid_attributes }.to change(Project, :count).by(1)
    end

    it 'exposes a newly created project as #project' do
      post :create, project: valid_attributes
      expect(assigns(:project)).to be_an_instance_of(Project)
      expect(assigns(:project)).to be_persisted
    end

    describe 'project response' do
      let(:json) { JSON.parse(response.body) }

      before do
        post :create, project: valid_attributes
      end

      it 'returnes project id' do
        expect(json['id']).to_not be_nil
      end

      it 'returnes project title' do
        expect(json['title']).to_not be_nil
      end

      it 'returnes project tasks' do
        expect(json['tasks']).to eq([])
      end
    end
  end

  describe 'PUT update' do
    let(:project) { create(:project) }
    let(:json) { JSON.parse(response.body) }

    it 'updates the requested project' do
      allow_any_instance_of(Project).to receive(:update).with(valid_attributes)
      put :update, id: project.to_param, project: valid_attributes
      expect(json).to eq(project.as_json)
    end

    it 'exposes the requested project' do
      put :update, id: project.to_param, project: valid_attributes
      expect(assigns(:project)).to eq(project)
    end
  end

  describe 'DELETE destroy' do
    let!(:project) { create(:project) }
    let(:json) { JSON.parse(response.body) }

    it 'destroys the requested project' do
      expect { delete :destroy, id: project.to_param }.to change(Project, :count).by(-1)
    end

    it 'returnes deleted project' do
      delete :destroy, id: project.to_param
      expect(json).to_not be_nil
    end
  end
end
