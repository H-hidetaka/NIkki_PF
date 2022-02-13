require 'rails_helper'

describe 'Diary＃create', type: :system do
  let(:user) { create(:user) }
  let(:diary) { create(:diary, user: user)}

  describe '日記のCRUD' do
    describe '日記の作成' do
      context 'ログインしている場合' do
        before do
          user = build(:user)
          sign_up(user)
          login(user)
          visit new_diary_path
        end

        it '日記が作成できること' do
          fill_in 'タイトル', with: 'テストタイトル'
          fill_in '本文', with: 'テスト本文'
          file_path = Rails.root.join('spec', 'fixtures', 'example.jpg')
          attach_file "サムネイル", file_path
          click_button '登録する'
          expect(current_path).to eq(new_diary_path)
          expect(page).to have_content('日記を作成しました')
        end

        it '日記が作成に失敗すること' do
          fill_in 'タイトル', with: 'テストタイトル'
          file_path = Rails.root.join('spec', 'fixtures', 'example.txt')
          fill_in '本文', with: 'テスト本文'
          attach_file "サムネイル", file_path
          click_button '登録する'
          expect(current_path).to eq(new_diary_path)
          expect(page).to have_content('日記を作成できませんでした')
        end
      end
    end
  end
end
