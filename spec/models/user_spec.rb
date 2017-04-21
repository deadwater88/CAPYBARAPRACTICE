# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'
require 'shoulda-matchers'

RSpec.describe User, type: :model do
  subject!(:user){ User.create(username: 'david', password: 'password' )}

  describe "validation" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it { should validate_length_of(:password).is_at_least(6) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_uniqueness_of(:session_token) }
  end

  describe "associations" do
    it { should have_many(:goals) }
    it { should have_many(:comments) }
  end

  describe "::find_by_credentials" do
    it 'should a return a user given valid credentials' do
      expect(User.find_by_credentials('david', 'password').attributes).to eq(user.attributes)
    end

    it 'should return nil if given invalid credentials' do
      expect(User.find_by_credentials('sam', 'password')).to be_nil
      expect(User.find_by_credentials('david', 'shark')).to be_nil
    end

  end

  describe '#reset_session_token!' do
    it 'changes session token' do
      pre_token = user.session_token
      user.reset_session_token!
      post_token = user.session_token
      expect(pre_token).to_not eq(post_token)
    end
  end

  describe '#password=' do
    it 'stores password as salted hash' do
      expect(BCrypt::Password.new(user.password_digest).is_password?(user.password)).to be true
    end
    it 'passwords are not stored' do
      expect(User.first.password).to be_nil
    end
  end

  describe '#is_password?' do
    it 'returns true if passwords match' do
      expect(user.is_password?('password')).to be true
    end
    it 'returns false otherwise' do
      expect(user.is_password?('shark')).to be false
    end
  end




end
