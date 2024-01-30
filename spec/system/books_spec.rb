require 'rails_helper'

RSpec.feature Book, type: :feature do
  it "is valid with a title" do
    visit new_book_path
    fill_in 'Title', with: 'Sample Title'
    click_on 'Create Book'
    expect(page).to have_content('Book was successfully created.')
  end

  it "is invalid without a title" do
    visit new_book_path
    fill_in 'Title', with: ''
    click_on 'Create Book'
    expect(page).to have_content('Book was not created')
  end

end

RSpec.feature "Books", type: :feature do
  scenario "User creates a new book with dropdown menu for published date" do
    visit new_book_path

    fill_in "Title", with: "Sample Title"
    fill_in "Author", with: "John Doe"
    fill_in "Price", with: 19.99

    select "2022", from: "book_published_date_1i"
    select "January", from: "book_published_date_2i"
    select "15", from: "book_published_date_3i"

    click_button "Create Book"

    expect(page).to have_content("Book was successfully created.")
  end
end
