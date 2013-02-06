FactoryGirl.define do
  factory :cat do
    name "Whimsy"
    breed "calico"
    age 9
    picture { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'test_cat.jpg'), 'image/jpg').read }
  end

  factory :rating do
    cat_id 1
    rating 0
  end
end