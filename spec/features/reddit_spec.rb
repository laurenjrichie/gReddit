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

feature 'homepage' do  # do you write tests for this stuff? Not exactly a "feature"...
  scenario 'homepage has correct title'
end

feature 'posting' do
  scenario 'homepage shows list of posts' do
    visit root_path
    Post.create!(title: "First post", content: "Test content")

    expect(page).to have_content ("Recent Posts")
    expect(page).to have_content ("First post")
  end

  scenario 'posts show author and when posted'

  scenario 'users can create a new post'
end
