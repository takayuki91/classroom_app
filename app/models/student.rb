class Student < ApplicationRecord
  
  # belongs_to :classroom
  
  #  （０= 女性 / １= 男性 / ）
  enum gender: { female: 0, male: 1 }
end
