# I want to see a 'Lose' message if I reach 0HP first

feature "lose game" do
  scenario "game over when one player reaches 0HP" do
    sign_in_and_play
    10.times{click_button "Attack!"}
    expect(page).to have_content("Sarah wins!")
  end
end
