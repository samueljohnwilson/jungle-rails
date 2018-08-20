require 'rails_helper'


RSpec.describe User, type: :model do

    describe 'Validations' do
    it 'should be valid if all attributes are valid' do
      expect(User.new(name: 'Steve', email: 'email@email.com', password: 'password', password_confirmation: 'password')).to be_valid

      user = User.new
      user.save

    end

    it 'should be invalid if the name attribute is not present' do
      expect(User.new(name: nil, email: 'email@email.com', password: 'password', password_confirmation: 'password')).to be_invalid

      user = User.new
      user.save

    end

    it 'should be invalid if the email attribute is not present' do
      expect(User.new(name: 'Steve', email: nil, password: 'password', password_confirmation: 'password')).to be_invalid

      user = User.new
      user.save

    end

    it 'should be invalid if the email attribute is not unique' do

      previousUser = User.new(name: 'Steve', email: 'email@email.email', password: 'password', password_confirmation: 'password')
      previousUser.save

      expect(User.new(name: 'Steve', email: 'EMAIL@EMAIL.EMAIL', password: 'password', password_confirmation: 'password')).to be_invalid

      user = User.new
      user.save

    end

    it 'should be invalid if the password attribute is not present' do
      expect(User.new(name: 'Steve', email: 'email@email.com', password: nil, password_confirmation: 'password')).to be_invalid

      user = User.new
      user.save

    end

    it 'should be invalid if the password attribute is fewer than 8 characters' do
      expect(User.new(name: 'Steve', email: 'email@email.com', password: 'pass', password_confirmation: 'pass')).to be_invalid

      user = User.new
      user.save

    end

    it 'should be invalid if the password_confirmation attribute is not present' do
      expect(User.new(name: 'Steve', email: 'email@email.com', password: 'password', password_confirmation: nil)).to be_invalid

      user = User.new
      user.save

    end

    it 'should be invalid if the password attribute does not match the password_confirmation' do
      expect(User.new(name: 'Steve', email: 'email@email.com', password: 'password', password_confirmation: 'different')).to be_invalid

      user = User.new
      user.save

    end

  end

  describe '.authenticate_with_credentials' do
    it 'should be valid if the password and email are authorized' do

      user = User.create(name: 'Steve', email: 'email@email.com', password: 'password', password_confirmation: 'password')
      user.save

      expect(User.authenticate_with_credentials('email@email.com', 'password')).to eq(user)

    end

  end

end
