class StudentsController < ApplicationController

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    @student.save
    redirect_to students_path
  end

  def index
    @students = Student.all
    
    students = Student.all

    # 学生をgenderでグループ分け
    male_students = students.select { |student| student.gender == "male" }
    female_students = students.select { |student| student.gender == "female" }

    # グループの数を決定
    group_count = 2

    # 各グループの学生数を計算
    male_students_per_group = (male_students.size.to_f / group_count).ceil
    female_students_per_group = (female_students.size.to_f / group_count).ceil

    # 学生をランダムにシャッフル
    male_students.shuffle!
    female_students.shuffle!

    # グループ分けの結果を格納する配列
    groups = []

    # グループごとに学生を割り当てる
    group_count.times do |i|
      group = []

      # male_studentsから割り当て
      group.concat(male_students.shift(male_students_per_group))

      # female_studentsから割り当て
      group.concat(female_students.shift(female_students_per_group))

      groups << group
    end

    # グループ分け結果をビューに渡す
    @grouped_students = groups

  end

  private

  def student_params
    params.require(:student).permit(:family_name, :gender)
  end

end