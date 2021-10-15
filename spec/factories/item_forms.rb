FactoryBot.define do
  factory :item_form do
    postal_code { '123-4567' }
    area_id { 2 }
    city           { 'aあア亜' }
    address_line   { '市町1-0-1' }
    building { 'マンション' }
    phone_number   { '08012345678' }
    token          { 'tok_abcdefghijk00000000000000000' }
    user_id{'1'}
    item_id{'1'}
  end
end
