class Feature < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  has_many :notes
  
  validates_presence_of :name
  validates_presence_of :estimated_hours
  validates_numericality_of :estimated_hours
  
  validates_numericality_of :completed_hours, :on => :update, :if => proc {|o| o.completed_hours != nil }
  
  named_scope :incomplete, :conditions => { :completed_hours => nil }
  named_scope :accurate, :conditions => 'completed_hours <= estimated_hours AND completed_hours IS NOT NULL'
  named_scope :inaccurate, :conditions => 'completed_hours >= estimated_hours AND completed_hours IS NOT NULL'
  named_scope :completed, :conditions => 'completed_hours IS NOT NULL'
end