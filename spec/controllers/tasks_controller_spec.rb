require 'rails_helper'

describe TasksController do
  let(:project) { create(:project) }
  let(:valid_attributes) { { description: 'New task' } }
  let(:json) { JSON.parse(response.body) }

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

    describe 'json response' do
      let(:json) { JSON.parse(response.body) }

      before do
        post :create, task: valid_attributes, project_id: project.to_param
      end

      it 'returnes task id' do
        expect(json['id']).to_not be_nil
      end

      it 'returnes task description' do
        expect(json['description']).to_not be_nil
      end

      it 'returnes task status' do
        expect(json['completed']).to_not be_nil
      end
    end
  end

  describe 'PUT update' do
    let(:task) { create(:task, project: project) }

    it 'updates the requested task' do
      allow_any_instance_of(Task).to receive(:update).with(valid_attributes)
      put :update, id: task.to_param, project_id: project.to_param, task: valid_attributes
      expect(json).to eq(task.as_json)
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

    it 'returnes deleted task' do
      delete :destroy, id: task.to_param, project_id: project.to_param
      expect(json).to_not be_nil
    end
  end

  describe 'PUT complete' do
    let!(:task) { create(:task, project: project, completed: false) }

    before do
      put :complete, id: task.to_param, project_id: project.to_param, task: { complete: true }
    end

    it 'marks the requested task as completed' do
      expect(Task.find(task.id).completed).to eq(true)
    end

    it 'retunes task json' do
      expect(json).to_not be_nil
    end
  end

  describe 'PUT sort' do
    let(:task1) { create(:task, project: project) }
    let(:task2) { create(:task, project: project) }

    xit 'saves tasks order' do
      put :sort, project_id: project.to_param, project: { tasks: [task1.id, task2.id] }
      expect(response).to have_http_status(:success)
    end
  end
end
