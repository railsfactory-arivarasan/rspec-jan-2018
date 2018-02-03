class Document < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :folder_id, presence: true
end
