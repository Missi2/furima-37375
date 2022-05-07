FactoryBot.define do
  factory :user do
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    nickname {'furima太郎'}
    first_name {'降間'}
    last_name {'太郎'}
    first_name_kana {'フリマ'}
    last_name_kana {'タロウ'}
    birthday {Faker::Date.between(from: '1930-01-01', to: '2017-12-31')}
  end
end