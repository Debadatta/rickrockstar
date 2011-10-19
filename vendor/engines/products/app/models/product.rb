class Product < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :description]

  validates :title, :presence => true, :uniqueness => true
  
  belongs_to :image
  belongs_to :brochure, :class_name => 'Resource'
end
