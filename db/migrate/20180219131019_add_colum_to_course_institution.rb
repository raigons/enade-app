class AddColumToCourseInstitution < ActiveRecord::Migration[5.1]
  def change
    add_column :course_institutions, :score, :float
    add_column :course_institutions, :student_average, :float
  end
end
