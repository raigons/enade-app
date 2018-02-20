class CourseInstitution < ApplicationRecord
  belongs_to :course
  belongs_to :institution

  accepts_nested_attributes_for :institution
end
