require 'rails_helper'

RSpec.describe 'ユーザー', type: :system do
  let(:user) { create(:user) }
  let(:diary) { create(:diary, user: user)}

  describe 'ユーザーのCRUD' do
    describe 'ユーザーの作成' do
      context 'ログイン前' do
        #1
        it 'ユーザーが作成できること' do
          user = build(:user)
          sign_up(user)
        end

        #2
        it 'ユーザーがログインできること' do
          user = build(:user)
          sign_up(user)
          login(user)
        end

        #2
        it '名前が空欄で、ユーザーが作成できない' do
          user = build(:user, name: '')
          sign_up_false(user)
        end

        #3
        it 'パスワードが空欄で、ユーザーが作成できない' do
          user = build(:user, password: '')
          sign_up_false(user)
        end

        #4
        it 'パスワード確認が空欄で、ユーザーが作成できない' do
          user = build(:user, password_confirmation: '')
          sign_up_false(user)
        end

        #5
        it 'メールアドレスが空欄で、ユーザーが作成できない' do
          user = build(:user, email: '')
          sign_up_false(user)
        end

        #6
        it 'ログアウトができる' do
          user = build(:user)
          sign_up(user)
          login(user)
          expect(current_path).to eq(diaries_path)
          logout
          expect(current_path).to eq(root_path)
        end
      end

      context 'ログイン後' do
        before do
          user = build(:user)
          sign_up(user)
          login(user)
        end

        #7
        it 'ログインボタンがない' do
          expect(page).to have_no_button('ログイン')
        end

        #8
        it '登録ボタンがない' do
          expect(page).to have_no_content('登録')
        end

        #9
        it 'プロフィール画面表示' do
          update_new(user)
        end

        #10
        it 'プロフィール編集画面の表示' do
          update_new(user)
          click_button '編集'
          expect(page).to have_content('プロフィール編集画面')
        end

        #11
        it 'プロフィール編集ができる' do
          update_new(user)
          click_button '編集'
          expect(page).to have_content('プロフィール編集画面')
          update(user)
          expect(page).to have_content('プロフィールが編集されました')
          expect(current_path).to eq(new_profile_path)
        end

        #12
        it '名前が空欄の場合、プロフィールが編集できない' do
          update_new(user)
          click_button '編集'
          expect(page).to have_content('プロフィール編集画面')
          update(user)
          fill_in 'user[name]', with: ''
          expect(page).to have_content('プロフィールが編集されました')
          expect(current_path).to eq(update_profile_path)
        end

        #13
        it 'メールアドレスが空欄の場合、プロフィールが編集できない' do
          update_new(user)
          click_button '編集'
          expect(page).to have_content('プロフィール編集画面')
          update(user)
          fill_in 'user[email]', with: ''
          expect(page).to have_content('プロフィールが編集されました')
          expect(current_path).to eq(update_profile_path)
        end

          it 'パスワードが空欄の場合、プロフィールが編集できない' do
          update_new(user)
          click_button '編集'
          expect(page).to have_content('プロフィール編集画面')
          update(user)
          fill_in 'user[password]', with: ''
          expect(page).to have_content('プロフィールが編集されました')
          expect(current_path).to eq(update_profile_path)
        end

        it 'パスワード確認が空欄の場合、プロフィールが編集できない' do
          update_new(user)
          click_button '編集'
          expect(page).to have_content('プロフィール編集画面')
          update(user)
          fill_in 'user[password_confirmation]', with: ''
          expect(page).to have_content('プロフィールが編集されました')
          expect(current_path).to eq(updaste_profile_path)
        end

      end
    end
  end
end


        #14
        #15
        #16
        #17
        #18
        #19
        #20
