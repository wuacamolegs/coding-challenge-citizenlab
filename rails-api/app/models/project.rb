class Project < ApplicationRecord
  has_and_belongs_to_many :topics
  belongs_to :folder, class_name: 'Folder', foreign_key: :parent_id

  validates :title, :description, :parent_id, presence: true
end
