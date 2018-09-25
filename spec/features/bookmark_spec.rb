feature 'viewing bookmarks' do
  scenario 'visiting the home page' do
     visit('/')
     expect(page).to have_content "Bookmark Manager"
  end
end
