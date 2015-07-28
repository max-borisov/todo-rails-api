require 'rails_helper'

describe TasksController do
  let(:project) { create(:project) }
  let(:valid_attributes) { { description: 'New task' } }
  let(:task) { create(:task, project: project) }

  before do
    js_accept_headers
  end

  describe 'POST create' do
    it 'creates a new Task' do
      expect {
        post :create, task: valid_attributes, project_id: project.to_param
      }.to change(Task, :count).by(1)
    end

    it 'exposes a newly created task as #task' do
      post :create, task: valid_attributes, project_id: project.to_param
      expect(assigns(:task)).to be_an_instance_of(Task)
      expect(assigns(:task)).to be_persisted
    end
  end

  describe 'PUT update' do
    it 'updates the requested task' do
      allow_any_instance_of(Task).to receive(:update).with(valid_attributes)
      put :update, id: task.to_param, project_id: project.to_param, task: valid_attributes
    end

    it 'exposes the requested task' do
      put :update, id: task.to_param, project_id: project.to_param, task: valid_attributes
      expect(assigns(:task)).to eq(task)
    end
  end

  describe 'DELETE destroy' do
    let!(:task) { create(:task, project: project) }

    it 'destroys the requested task' do
      expect {
        delete :destroy, id: task.to_param, project_id: project.to_param
      }.to change(Task, :count).by(-1)
    end
  end

  describe 'PUT complete' do
    let!(:task) { create(:task, project: project, completed: false) }

    it 'completes the requested task' do
      put :complete, id: task.to_param, project_id: project.to_param, task: { complete: true }
      expect(Task.find(task.id).completed).to eq(true)
    end
  end

  describe 'PUT sort' do
    let(:task1) { create(:task, project: project) }
    let(:task2) { create(:task, project: project) }

    it 'saves tasks order' do
      put :sort, project_id: project.to_param, project: { tasks: [task1.id, task2.id] }
      expect(response).to have_http_status(:success)
    end
  end
end
