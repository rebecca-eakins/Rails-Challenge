class Author < ActiveRecord::Base
  has_many :posts

  validates :first_name,    presence: true
  validates :last_name,     presence: true
  validates :email_address, presence: true,
    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
              message: 'only valid e-mail addresses allowed' }

  def formatted_name
    "#{first_name} #{last_name}"
  end
end
