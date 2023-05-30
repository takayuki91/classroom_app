class Classroom < ApplicationRecord
  
  # has_many :students, dependent: :destroy
   
  # クラス替えの人数制約
  def self.auto_assign_students(constraints)
    all_students = Student.all.shuffle
    
  # 人数が割り切れない時の生徒
    remaining_students = all_students.size % constraints[:classroom_count]
    
  # 人数を振り分ける
    constraints[:classroom_count].times do |i|
      classroom_size = all_students.size / constraints[:classroom_count]
      if i < remaining_students
        classroom_size += 1
        classroom = Classroom.create(name: "Classroom #{i + 1}")
        classroom_students << all_students.shift(classroom_size)
      else
        classroom = Classroom.create(name: "Classroom #{i + 1}")
        classroom_students << all_students.shift(classroom_size)
      end
    end
  end
  
end