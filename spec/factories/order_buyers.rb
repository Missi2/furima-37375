FactoryBot.define do
  factory :order_buyer do
    postal_code { '123-1234' }
    prefecture_id { 1 }
    municipalities { '横浜市緑区' }
    address { '青山1-1-1' }
    building_name { '柳ビル103' }
    telephone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
