class Post < ActiveRecord::Base
  belongs_to :author
  has_and_belongs_to_many :tags

  validates :header,  presence: true,
                      length: { in: 5..50 }
  validates :body,    presence: true,
                      length: { in: 50..2500 }
  validates :author,  presence: true


  # TASK 1 HELPER METHODS:

  def lead_paragraph
    self.body.split("\n").first.strip
  end

  def content_paragraph_arr
    self.body.split("\n")[1..-1]
  end
end
