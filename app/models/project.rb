class Project < ActiveRecord::Base
  has_many :assignments
  has_many :users, through: :assignments

  validates :title, presence: true
  validates :content, presence: true
end
