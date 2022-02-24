FactoryBot.define do
  factory :diary do
    title { "Title" }
    body { "本日はお日柄もよく。" }
    association :user
  end
end
