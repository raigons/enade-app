class CourseInstitution < ApplicationRecord
  belongs_to :course
  belongs_to :institution
end
