class Institution < ApplicationRecord
  has_many :courses_institutions, class_name: 'CourseInstitution'
  has_many :courses, through: :courses_institutions
end
