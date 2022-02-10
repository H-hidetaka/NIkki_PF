FactoryBot.define do
  factory :user do
    # Faker::Config.locale = :ja
    # diaries { FactoryBot.create(:diaries)}
    sequence(:name)  { |n| "#{n}abe"}
    # sequence(:name)                        { Faker::Name.name }
    sequence(:email) { |n| "person#{n}@example.com" }
    # sequence(:email)                       { Faker::Internet.free_email }
    # password = Faker::Internet.password(min_length: 6)
    password                    { "00000000" }
    password_confirmation       { "00000000" }
  end
  # trait :diaries do
  #   title { "title" }
  #   body { "body is max 60000" }
  # end
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
