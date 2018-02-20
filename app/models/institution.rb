class Institution < ApplicationRecord
  has_many :courses_institutions, class_name: 'CourseInstitution'
  has_many :courses, through: :courses_institutions

  accepts_nested_attributes_for :courses_institutions
  accepts_nested_attributes_for :courses, allow_destroy: false
end
