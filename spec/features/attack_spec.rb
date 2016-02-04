# I want to attack Player 2, and I want to get a confirmation

feature "attack player" do

  scenario "User2 attacks player 1" do
    sign_in_and_play
    click_button "Attack!"
    expect(page).to have_text("sarah has attacked mic!")
  end

  scenario "reduce HP" do
    sign_in_and_play
    click_button "Attack!"
    click_link "Back to battle"
    expect(page).to have_text("9")
  end

  scenario "switch players" do
    sign_in_and_play
    click_button "Attack!"
    click_button "switch attack"
    # expect(page).to have_text("Player 2s turn")
  end

 scenario "back to player 1" do
   click_button "Attack!"
   click_button "switch attack"
   click_button "Attack!"
   expect(page).to have_text("Sara has attacked Mic")
 end

end
