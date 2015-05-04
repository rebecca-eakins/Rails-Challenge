FactoryGirl.define do
  factory :post do
    header    { Faker::Lorem.words(4).join(' ').titleize }
    subheader { Faker::Lorem.words(7).join(' ').titleize}
    body do
      paragraphs = []
      paragraphs << Faker::Lorem.paragraph(1 + rand(10))
      paragraphs << Faker::Lorem.paragraph(1 + rand(10))
      paragraphs << Faker::Lorem.paragraph(1 + rand(10))

      paragraphs.join("\n")
    end

    author
  end
end
