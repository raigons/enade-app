class CreateJoinTableCourseInstitution < ActiveRecord::Migration[5.1]
  def change
    create_join_table :institutions, :course do |t|
      t.index [:institution_id, :course_id]
      t.index [:course_id, :institution_id]
    end
  end
end
