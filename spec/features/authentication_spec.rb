require 'rails_helper'

feature 'signing in and out' do

  scenario 'Users can sign in from the navbar' do
    User.create!(
    email: 'testing@signin.com',
    password: 'blerch',
    )

    visit root_path
    click_on 'Sign In'
    fill_in :user_email, with: "testing@signin.com"
    fill_in :user_password, with: "blerch"
    click_on "Sign In"
  end

  scenario 'Users can sign out'

end
