require 'rails_helper'

feature 'navbar' do

  scenario 'Users can sign up from the navbar' do
    visit root_path
    click_on 'Sign Up'
    fill_in :user_name, with: 'Foo Bar'
    fill_in :user_email, with: "foobar@foo.bar"
    fill_in :user_password, with: "blerch"
    fill_in :user_password_confirmation, with: "blerch"
    click_on "Create User"

    expect(page).to have_content("You have successfully signed up for gReddit")
  end
  
end
