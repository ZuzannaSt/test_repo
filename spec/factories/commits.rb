FactoryGirl.define do
  factory :commit do
    name "Test Commit"
    hash_string "Test String"
    user nil
    project nil
    branch nil
  end

end
