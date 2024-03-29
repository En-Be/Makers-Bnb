feature "confirming booking" do
  scenario "user can confirm a booking request" do
    create_account
    login
    new_space
    expect(current_path).to eq('/spaces')
    click_button('Logout')
    create_account_alt
    login_alt
    click_button("book Skinner House")
    expect(current_path).to eq('/bookings/requests')
    expect(page).to have_content("Thank you for your request")
    click_button 'Return to spaces'
    expect(current_path).to eq('/spaces')
    click_button('Logout')
    create_account
    login
    click_button 'Review'
    expect(current_path).to eq('/bookings/review')
    expect(page).to have_content("Skinner House")
    click_button 'Confirm Skinner House booking'
    expect(page).to have_content("You have confirmed the request")
    click_button 'Return to reviews'
    expect(page).not_to have_content("Confirm Skinner House booking")
    click_button 'Return to spaces'
    expect(page).not_to have_content("Skinner House")
  end
end
