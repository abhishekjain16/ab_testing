class Experiment < ActiveRecord::Base
  has_many :variations
  
  scope :with_variations, includes(:variations).where('variations.experiment_id is not null').references(:variations)
end
