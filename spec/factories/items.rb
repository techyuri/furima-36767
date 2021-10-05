FactoryBot.define do
  factory :item do
    name                  {"ito"}
    explain               {"setsumei"}
    category_id           {"2"}
    state_id             {"2"}
    delivery_id       {"2"}
    area_id    {"45"}
    burden_id       {"2"}
    price                 {"5000"}
    user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
  end
end