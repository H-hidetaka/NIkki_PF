FactoryBot.define do
  factory :user do
    sequence(:name)  { |n| "abe"}
    sequence(:email) { |n| "hiro#{n}@example.com"}
    password                    {"00000000"}
    password_confirmation       {"00000000"}
  end
end

    # sequence(:name) { |n| "admin-#{n}" }
    # password { 'password' }
    # password_confirmation { 'password' }
    # role { :admin }

    # trait :admin do
    #   sequence(:name) { |n| "admin-#{n}" }
    #   role { :admin }
    # end

    # trait :editor do
    #   sequence(:name) { |n| "editor-#{n}" }
    #   role { :editor }
    # end

    # trait :writer do
    #   sequence(:name) { |n| "writer-#{n}" }
    #   role { :writer }
#     end
#   end
# end
