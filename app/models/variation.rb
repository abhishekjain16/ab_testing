class Variation < ActiveRecord::Base
  belongs_to :experiment

  before_save :strip_new_line, :if => :data_changed?


  def strip_new_line
    self.data.squish!
  end
end
