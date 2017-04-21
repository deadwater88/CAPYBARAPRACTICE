# == Schema Information
#
# Table name: user_comments
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  author_id  :integer          not null
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe UserComment, type: :model do

    describe 'validations' do
      it {should validate_presence_of(:user_id)}
      it {should validate_presence_of(:author_id)}
      it {should validate_presence_of(:body)}
    end

    describe 'relations' do
      it {should belong_to(:user)}
      it {should belong_to(:author)}
    end
end
