class Chef < ActiveRecord::Base
  has_many :recipes
  before_save { self.email = email.downcase } #change email to lowercase before saving email addresses
  validates :chefname, presence: true, length: { minimum: 3, maximum: 40 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #regex for email validity
  validates :email, presence: true, length: { maximum: 105 }, 
                                    uniqueness: { case_sensitive: false }, 
                                    format: { with: VALID_EMAIL_REGEX }
end