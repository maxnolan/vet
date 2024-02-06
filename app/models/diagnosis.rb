class Diagnosis < ApplicationRecord
  has_and_belongs_to_many :pets

  validates :name, presence: true
end
