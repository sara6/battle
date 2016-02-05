# I want to attack Player 2, and I want to get a confirmation

feature "attack player" do

  scenario "User2 attacks player 1" do
    sign_in_and_play
    click_button "Attack!"
    expect(page).to have_text("Attack on mic successful - reduced HP with 10")
  end

  scenario "reduce HP" do
    sign_in_and_play
    click_button "Attack!"
    click_button "Continue"
    expect(page).to have_text("9")
  end

  scenario "switch players" do
    sign_in_and_play
    click_button "Attack!"
    click_button "Continue"
    expect(page).to have_content("mic is playing")
  end

end
