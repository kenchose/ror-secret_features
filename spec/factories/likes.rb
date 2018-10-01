FactoryBot.define do
  factory :like do
    user { @user }
    secret { @secret }
  end
end
