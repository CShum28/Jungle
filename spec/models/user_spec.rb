require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'Should have a first_name' do
      user = User.new(
        first_name: 'Clement',
        last_name: 'Shum',
        email: 'test@test.com', 
        password: 'password', 
        password_confirmation: 'password'
      )
      expect(user.first_name).to be_truthy
    end

    it 'Should have a last_name' do
      user = User.new(
        first_name: 'Clement',
        last_name: 'Shum',
        email: 'test@test.com', 
        password: 'password', 
        password_confirmation: 'password'
      )
      expect(user.last_name).to be_truthy
    end

    it 'Should have an email' do
      user = User.new(
        first_name: 'Clement',
        last_name: 'Shum',
        email: 'test@test.com', 
        password: 'password', 
        password_confirmation: 'password'
      )
      expect(user.email).to be_truthy
    end

    it 'Should have an email that is case sensative' do
      user = User.new(
        first_name: 'Clement',
        last_name: 'Shum',
        email: 'test@test.com', 
        password: 'password', 
        password_confirmation: 'password'
      )
      expect(user.email).not_to eq('TEST@TEST.COM')
    end

    it 'Should have a password' do
      user = User.new(
        first_name: 'Clement',
        last_name: 'Shum',
        email: 'test@test.com', 
        password: 'password', 
        password_confirmation: 'password'
      )
      expect(user.password).to eq('password')
    end

    it 'Should have a password and password_confirmation match' do
      user = User.new(
        first_name: 'Clement',
        last_name: 'Shum',
        email: 'test@test.com', 
        password: 'password', 
        password_confirmation: 'password'
      )
      expect(user.password_confirmation).to eq(user.password)
    end

    it 'Should have a password and password_confirmation do not match' do
      user = User.new(
        first_name: 'Clement',
        last_name: 'Shum',
        email: 'test@test.com', 
        password: 'password', 
        password_confirmation: 'password1'
      )
      expect(user.password_confirmation).not_to eq(user.password)
    end

    it 'Should have a password length of at least 5' do
      user = User.new(
        first_name: 'Clement',
        last_name: 'Shum',
        email: 'test@test.com', 
        password: 'pass', 
        password_confirmation: 'pass'
      )
      
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
    end

  end

  describe '.authenticate_with_credentials' do
    it 'should be allowed to pass with valid credentials' do
      user = User.create(
        first_name: 'Clement',
        last_name: 'Shum',
        email: 'test@test.com', 
        password: 'password', 
        password_confirmation: 'password'
      )

      # Call the .authenticate_with_credentials method with the user's email and password
      authenticated_user = User.authenticate_with_credentials('test@test.com', 'password')

      # Expect the returned user to match the original user
      expect(authenticated_user).to eq(user)
    end

    it 'should not be allowed to pass with invalid password' do
      user = User.create(
        first_name: 'Clement',
        last_name: 'Shum',
        email: 'test@test.com', 
        password: 'password', 
        password_confirmation: 'password'
      )

      # Call the .authenticate_with_credentials method with the user's email and password
      authenticated_user = User.authenticate_with_credentials('test@test.com', 'password1')

      # Expect the returned user to match the original user
      expect(authenticated_user).to be_nil
    end

    it 'should not be allowed to pass with invalid email' do
      user = User.create(
        first_name: 'Clement',
        last_name: 'Shum',
        email: 'test@test.com', 
        password: 'password', 
        password_confirmation: 'password'
      )

      # Call the .authenticate_with_credentials method with the user's email and password
      authenticated_user = User.authenticate_with_credentials('test123@test.com', 'password1')

      # Expect the returned user to match the original user
      expect(authenticated_user).to be_nil

    end

    context 'edge cases' do
      it "should authenticate successfully if there are spaces infront and behind email" do
        user = User.create(
          first_name: 'Clement',
          last_name: 'Shum',
          email: 'test@test.com', 
          password: 'password', 
          password_confirmation: 'password'
        )

        authenticated_user = User.authenticate_with_credentials('  test@test.com  ', 'password')

        # Expect the returned user to match the original user
        expect(authenticated_user).to eq(user)

      end

      it 'should be authenticated with user email case is wrong' do
        user = User.create(
          first_name: 'Clement',
          last_name: 'Shum',
          email: 'test@test.com', 
          password: 'password', 
          password_confirmation: 'password'
        )

        authenticated_user = User.authenticate_with_credentials('TEST@test.com', 'password')

        # Expect the returned user to match the original user
        expect(authenticated_user).to eq(user)
      end
    end

  end

end
