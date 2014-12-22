require 'rails_helper'

feature 'navbar' do
  scenario 'sign up and sign in show up in navbar' do  # make them functional!
    visit root_path

    expect(page).to have_content("Sign Up")
    expect(page).to have_content("Sign In")
  end

  scenario 'users can sign up'
  scenario 'users can sign in'
end
