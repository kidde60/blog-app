require 'rails_helper'

RSpec.describe 'User index', type: :feature do
 before(:each) do
    @first_user = User.create(name: 'Kidde',
                              photo: 'data:image/jpeg;base64,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',
                              bio: 'web developer.')
    @second_user = User.create(name: 'William',
                               photo: 'data:image/jpeg;base64,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',
                               bio: 'React developer.')

    @first_post = Post.create(author: @first_user, title: 'Hello',
                              text: 'Lorem Ipsum is not simply random text.')
    @second_post = Post.create(author: @second_user, title: 'Hello 1',
                               text: 'Lorem Ipsum is not simply random text.')

    Comment.create(post: @first_post, author: @second_user, text: 'Hello')
    Comment.create(post: @second_post, author: @first_user, text: 'I liked this article')
    Comment.create(post: @first_post, author: @first_user, text: 'Fantastic, unbelievable')

    Like.create(post: @first_post, author: @second_user)
    Like.create(post: @first_post, author: @first_user)
  end
  it 'should display username' do
    visit users_path(@first_user)
    expect(page).to have_content @first_user.name
  end

  it 'should display users profile picture' do
    visit users_path(@first_user)
    expect(page).to have_css("img[src*='#{@first_user.photo}']")
  end

  it 'should display number of posts by given user' do
    visit users_path(@first_user)
    expect(page).to have_content('Number of posts: 1')
    visit users_path(@second_user)
    expect(page).to have_content('Number of posts: 1')
  end

  it 'should redirect to user show page' do
    visit users_path(@first_user)
    click_link @first_user.name.to_s
    expect(current_path).to eq user_path(@first_user)
  end
end
