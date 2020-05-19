class Topic < ApplicationRecord
  has_and_belongs_to_many :projects
  validates :name, presence: true
end
