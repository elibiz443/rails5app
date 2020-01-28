require "application_system_test_case"

class MainpagesTest < ApplicationSystemTestCase
  setup do
    @mainpage = mainpages(:one)
  end

  test "visiting the index" do
    visit mainpages_url
    assert_selector "h1", text: "Mainpages"
  end

  test "creating a Mainpage" do
    visit mainpages_url
    click_on "New Mainpage"

    click_on "Create Mainpage"

    assert_text "Mainpage was successfully created"
    click_on "Back"
  end

  test "updating a Mainpage" do
    visit mainpages_url
    click_on "Edit", match: :first

    click_on "Update Mainpage"

    assert_text "Mainpage was successfully updated"
    click_on "Back"
  end

  test "destroying a Mainpage" do
    visit mainpages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mainpage was successfully destroyed"
  end
end
