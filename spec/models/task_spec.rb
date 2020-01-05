# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:employee) { FactoryBot.create(:employee) }
  let(:task) do
    FactoryBot.create(:task, employee: employee, creator_id: employee.id,
                             assignee_id: employee.id)
  end

  describe 'validates' do
    context 'presence' do
      it { should validate_presence_of :title }
      it { should validate_presence_of :creator_id }
      it { should validate_presence_of :assignee_id }
    end

    describe 'scopes' do
      it '#completed should return completed tasks' do
        task.complete!
        expect(Task.completed.count).to be(1)
        expect(task.complete?).to be(true)
      end
      it '#in_work should return in work tasks' do
        task.in_work!
        expect(Task.in_work.count).to be(1)
      end
      it '#untaken should return untaken tasks' do
        expect(Task.untaken.count).to be
      end
    end

    describe 'associations' do
      it { should belong_to(:employee) }
    end
  end
end
