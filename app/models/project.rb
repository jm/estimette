class Project < ActiveRecord::Base
  belongs_to :user
  has_many :features
  
  validates_presence_of :name
    
  def estimated_hours
    hours = 0.0
    features.map {|f| hours += (f.estimated_hours || 0)}
    
    hours
  end
  
  def completed_hours
    hours = 0.0
    features.map {|f| hours += (f.completed_hours || 0)}
    
    hours
  end
end