class Folder < ApplicationRecord
  belongs_to :folder, class_name: 'Folder', foreign_key: :parent_id, optional: true

  validates :title, :description, presence: true
end
