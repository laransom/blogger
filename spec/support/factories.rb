FactoryGirl.define do

  factory :post do
    title 'Hello World'
    author 'Lee Ransom'
    body 'Testing out my home made blog'
  end

  factory :comment do
    author 'Jeff Bezos'
    body 'Great Blog'
    post
  end
end
