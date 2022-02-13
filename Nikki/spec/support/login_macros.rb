module LoginMacros
  def login(user)
    visit login_path
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_button 'ログイン'
    expect(page). to have_content 'ログインしました'
  end

  def sign_up(user)
    visit new_user_path
    fill_in 'user[name]', with: user.name
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    fill_in 'user[password_confirmation]', with: user.password_confirmation
    click_button '登録'
    expect(page).to have_content '登録'
    expect(current_path).to eq(login_path)
  end

  def sign_up_false(user)
    visit new_user_path
    fill_in 'user[name]', with: user.name
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    fill_in 'user[password_confirmation]', with: user.password_confirmation
    click_button '登録'
    expect(page).to have_content '登録'
    expect(current_path).to eq(users_path)
  end

  def logout
    expect(page).to have_content('ログアウト')
    click_link 'ログアウト'
    expect(page).to have_content 'ログアウトしました'
  end

  def update_new(user)
    visit new_profile_path
    expect(page).to have_content 'プロフィール'
  end

  def update(user)
    fill_in 'user[name]', with: user.name
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    fill_in 'user[password_confirmation]', with: user.password_confirmation
    click_button '編集'
  end

  def stay_login_status(user)

  end
end
