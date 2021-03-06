# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  body       :text             not null
#  completed  :boolean          default("false"), not null
#  public     :boolean          default("false"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Goal < ApplicationRecord
  validates :user_id, :body, presence: true
  #validates :public, :completed, inclusion: {in: [true, false]}

  has_many :comments,
    class_name: :GoalComment
  belongs_to :user,
    class_name: :User
end
