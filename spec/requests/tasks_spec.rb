require 'rails_helper'

RSpec.describe "Tasks", type: :request do

  describe "GET /tasks" do
    it "renders new tasks link" do
      get tasks_path
      expect(response.body).to include("New Task")
    end
    
    it "HTTP 200を返す" do
      get tasks_path
      expect(response.response_code).to eq(Rack::Utils::SYMBOL_TO_STATUS_CODE[:ok])
    end
  end
  
  describe "POST /tasks" do
    it "taskが1件増える" do
      expect do
        post tasks_path, params: {task: attributes_for(:task)}
        follow_redirect!
      end.to change { Task.count }.by(1)
    end
  end

  describe "PATCH /tasks/:id/done" do
    let!(:task) { create(:task, done: false).save }
    
    it "doneがfalseからtrueになる" do
      expect do
        patch done_task_path(task)
        expect(task.reload.done).to eq true
      end
    end
  end
end
