require "application_system_test_case"

class AsTest < ApplicationSystemTestCase
  setup do
    @a = as(:one)
  end

  test "visiting the index" do
    visit as_url
    assert_selector "h1", text: "As"
  end

  test "creating a A" do
    visit as_url
    click_on "New A"

    fill_in "Body", with: @a.body
    fill_in "Image", with: @a.image
    fill_in "Subject", with: @a.subject
    click_on "Create A"

    assert_text "A was successfully created"
    click_on "Back"
  end

  test "updating a A" do
    visit as_url
    click_on "Edit", match: :first

    fill_in "Body", with: @a.body
    fill_in "Image", with: @a.image
    fill_in "Subject", with: @a.subject
    click_on "Update A"

    assert_text "A was successfully updated"
    click_on "Back"
  end

  test "destroying a A" do
    visit as_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "A was successfully destroyed"
  end
end
