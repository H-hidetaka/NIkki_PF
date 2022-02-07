module LoginMacros
  def login(user)
    visit login_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'ログイン'
  end

  def logout
    click_link 'ログアウト'
    expect(page).to have_content 'ログアウトしました。'
  end

  def act_as(user)
    login user
    yield
    logout
  end
end
