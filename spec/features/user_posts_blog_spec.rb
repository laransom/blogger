require 'spec_helper'

feature 'Post blog', %q{
  As the blog administrator
  I should be able to make blog posts
  so that they will appear on the page
} do

  context 'as blog administrator' do

    let(:post) { FactoryGirl.build(:post) }

    before :each do
      visit new_post_path
    end

    scenario 'User makes valid blog post' do

      pre_count = Post.count

      fill_in 'Title', with: post.title
      fill_in 'Author', with: post.author
      fill_in 'Body', with: post.body

      click_on 'Post'

      expect(page).to have_content 'Post Added'
      expect(Post.count).to eq(pre_count + 1)

    end

    scenario 'User does not fill out blog post form correctlty' do

      pre_count = Post.count

      click_on 'Post'

      within(:css, '.post_title') do
        expect(page).to have_content "can't be blank"
      end

      within(:css, '.post_author') do
        expect(page).to have_content "can't be blank"
      end

      within(:css, '.post_body') do
        expect(page).to have_content "can't be blank"
      end

      expect(page).to have_content 'Post Failed'
      expect(Post.count).to eq(pre_count)

    end
  end
end
