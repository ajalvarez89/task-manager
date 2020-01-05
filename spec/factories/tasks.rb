# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    title { "First Task" }
    description { "Description Task" }
    status { "untaken" }
    association :employee
  end
end
