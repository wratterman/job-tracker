class Category < ApplicationRecord
  has_many :jobs
  validates :name, presence: true, uniqueness: true

  def companies
    self.jobs.map do |job|
      job.company
    end
  end
end
