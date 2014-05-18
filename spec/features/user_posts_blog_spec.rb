require 'spec_helper'

feature 'Post blog', %q{
  As the blog administrator
  I should be able to make blog posts
  so that they will appear on the page
} do

  context 'as blog administrator' do

    scenario 'User makes valid blog post' do

      pre_count = Post.count
      visit new_post_path

      fill_in 'Title', with: 'hello'
      fill_in 'Author', with: 'world'
      fill_in 'Body', with: 'body'

      click_on 'Post'

      expect(page).to have_content 'Post Added'
      expect(Post.count).to eq(pre_count + 1)

    end
  end
end
