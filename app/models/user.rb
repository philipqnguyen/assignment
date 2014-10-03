class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true

  has_many :mentships
  has_many :projects, through: :mentships

  def created_projects
    projects = []
    mentships.where(role: 'creator').each do |ments|
      projects << Project.find(ments.project_id)
    end
    projects
  end

  def joined_projects
    projects = []
    mentships.where(role: 'participant').each do |ments|
      projects << Project.find(ments.project_id)
    end
    projects
  end
end
