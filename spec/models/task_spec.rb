require 'rails_helper'

RSpec.describe Task, type: :model do
  it "is valid with name and done" do
    task = build(:task)
    expect(task).to be_valid
  end

  it "is not done of new object" do
    task = build(:task)
    expect(task.done).to be_falsey
  end

  it "is done with process complete method" do
    task = build(:task)
    task.complete
    expect(task.done).to be_truthy
  end

  describe "#complete" do
    let(:task) { FactoryGirl.create(:task, done: false) }
    
    it "doneがfalseからtrueになること" do
      expect do
        task.complete
      end.to change(task, :done).from(false).to(true)
    end
  end
end
