class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :family_name
      t.string :given_name
      t.string :family_name_kana
      t.string :given_name_kana
      t.integer :gender
      t.integer :test
      t.integer :previous
      t.integer :sport, default: 1
      t.integer :music, default: 1
      t.integer :support, default: 1
      t.integer :leader, default: 1
      t.integer :option1, default: 1
      t.integer :option2, default: 1
      t.integer :option3, default: 1

      t.timestamps
    end
  end
end
