require 'rails_helper'

feature 'signing in and out' do

  scenario 'Users can sign in from the navbar' do
    User.create!(
      name: 'test signin',
      email: 'testing@signin.com',
      password: 'blerch',
    )

    visit root_path
    click_on 'Sign In'
    fill_in :email, with: "testing@signin.com"
    fill_in :password, with: "blerch"
    click_on "Submit"

    expect(page).to have_content("Signed in as test signin")
  end

  scenario 'Users can sign out'

end
