FactoryGirl.define do
  factory :snap_application do
    email "test@example.com"
    name "RJD2"
    birthday 50.years.ago
    street_address "125 E Union St"
    city "Flint"
    county "Genesee"
    state "MI"
    zip "48502"
    signature "Mr. RJD2"
    signed_at Date.current
  end
end
