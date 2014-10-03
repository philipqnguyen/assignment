class Project < ActiveRecord::Base
  has_many :mentships
  has_many :users, through: :mentships
  # has_many :roles, through: :mentships, class_name: 'User', source: :user

  validates :title, presence: true
  validates :content, presence: true

  class NilUser
    def username
      'None'
    end

    def participants
      ['None']
    end

    def count
      0
    end
  end

  def creator
    User.find(mentships.where(role: 'creator')[0].user_id)
  rescue
    NilUser.new
  end

  def participants
    participating_users participating_mentships

  rescue
    NilUser.new
  end

  private

  def participating_mentships
    mentship_results = []

    mentships.where(role: 'participant').each do |ments|
      mentship_results << ments
    end
  end

  def participating_users(mentship_results)
    results = []

    mentship_results.each do |record|
      results << User.find(record.user_id)
    end

    results
  end
end
