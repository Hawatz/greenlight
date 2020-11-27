class BillingPlan < ApplicationRecord
  has_many :users
  validates :global_max_participants, numericality: { greater_than: 0 }, presence: true
  validates :global_max_duration, numericality: { greater_than: 0 }, presence: true, unless: :unlimited_duration?
  validates :price, numericality: { greater_than_or_equal_to: 0 }, presence: true
  validates :name, length: { maximum: 256 }, presence: true

  def unlimited_duration?
    unlimited_duration
  end
end
