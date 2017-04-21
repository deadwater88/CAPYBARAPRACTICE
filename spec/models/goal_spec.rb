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

require 'rails_helper'

RSpec.describe Goal, type: :model do

  describe 'validations' do
    it {should validate_presence_of(:user_id)}
    it {should validate_presence_of(:body)}
  end

  describe 'relations' do
    it {should belong_to(:user)}
    it {should have_many(:comments)}
  end



end
