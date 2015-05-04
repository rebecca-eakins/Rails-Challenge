class Tag < ActiveRecord::Base
  before_save :create_short_name

  has_and_belongs_to_many :posts

  validates :name,  presence: true,
                    length: { in: 5..50 }

  def create_short_name
    self.short_name = name.parameterize
  end
end
