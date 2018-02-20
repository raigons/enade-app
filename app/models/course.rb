class Course < ApplicationRecord
  has_many :courses_institutions, class_name: 'CourseInstitution' 
  has_many :institutions, through: :courses_institutions, source: :institution

  accepts_nested_attributes_for :courses_institutions
end
