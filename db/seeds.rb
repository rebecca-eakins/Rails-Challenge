4.times do
  FactoryGirl.create(:author)
end

10.times do
  FactoryGirl.create(:tag)
end

20.times do
  tags = Tag.order('RANDOM()').limit('3')
  author = Author.order('RANDOM()').first
  FactoryGirl.create(:post, author: author, tags: tags)
end
