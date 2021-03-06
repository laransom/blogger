require 'spec_helper'

feature 'Add Comments', %q{
  As a user
  I should be able to comments
  so that they will under the specific blog post
} do

  context 'as a user' do

    let(:post) { FactoryGirl.create(:post) }
    let(:comment) { FactoryGirl.build(:comment) }

    before :each do
      visit post_path(post)
    end

    scenario 'User makes valid comment' do

      pre_count = Comment.count

      fill_in 'Name', with: comment.author
      fill_in 'Body', with: comment.body

      click_on 'Add Comment'

      expect(page).to have_content 'Comment Added'
      expect(Comment.count).to eq(pre_count + 1)
    end

    scenario 'User does not fill out comment form correctly' do

      pre_count = Comment.count

      click_on 'Add Comment'

      within(:css, '.comment_body') do
        expect(page).to have_content "can't be blank"
      end

      expect(page).to have_content 'Comment Unsuccessful'
      expect(Comment.count).to eq(pre_count)

    end
  end
end


