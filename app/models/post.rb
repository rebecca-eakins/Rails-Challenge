class Post < ActiveRecord::Base
  belongs_to :author
  has_and_belongs_to_many :tags

  validates :header,  presence: true,
                      length: { in: 5..50 }
  validates :body,    presence: true,
                      length: { in: 50..2500 }
  validates :author,  presence: true

  def lead_paragraph
    self.body.split("\n").first.strip
  end

  def content_paragraph_arr
    self.body.split("\n")[1..-1]
  end

  def published_at
    self.created_at.in_time_zone('Eastern Time (US & Canada)').strftime('%A, %b %-d, %Y at %l:%M %p %Z')
  end

  def formatted_tags
    self.tags.collect {|tag| tag.name }.join(", ")
  end

  def description
    self.body.split(".")[0..1].join(". ")
  end
end