FactoryBot.define do
    factory :user do
      name                  {"あ"}
      nickname              {"test"}
      email                 {"test@example"}
      profile               {"よろしくお願い致します。"}
      password              {"00000a"}
      password_confirmation {password}
    end
  end