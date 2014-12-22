require 'rails_helper'

feature 'CRUDING posts' do
  scenario 'homepage shows list of posts' do
    Post.create!(title: "First post", content: "Test content")

    visit root_path

    expect(page).to have_content("Recent Posts")
    expect(page).to have_content("First post")
  end

  scenario 'users can create a new post' do
    visit root_path
    click_on 'Post something'
    fill_in :post_title, with: "My post is rad"
    fill_in :post_content, with: "here is my content"
    click_on "Create Post"

    expect(page).to have_content("My post is rad")
  end

  scenario 'clicking on g takes you to list of posts'
  scenario 'users can click an individual post and see its show page'
  scenario 'posts show author and when posted'  #?? create user model
  scenario 'users can delete a post'
  scenario 'users can edit a post'
end
