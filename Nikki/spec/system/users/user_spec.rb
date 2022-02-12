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
          expect(page).to have_content 'ログアウト'
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
        it 'ログインができる' do
          expect(page). to have_content 'ログインに成功しました'
        end
      end
    end
  end
end

  #     it 'ユーザーが'
  #       user = build(:user, email:'')
  #       user = build(:user, password:'')
  #       user = build(:user, email:'')
  #       user = build(:user, password_confirmation:'')

  #   #1
  #   it 'ユーザー登録ができる' do
  #     user = build(:user)
  #     visit new_user_path
  # end

      # it '名前が空欄の場合、ユーザー登録できない' do
      #   include_context '基本ユーザー'
      #   user = build(:user, name:'')
      #   visit new_user_path
      #   sign_up_false(user)
      #   expect(page).to have_content '登録'
      # end


      #5


      #6
      #7
      #8
      #9
      #10
      #11
      #12
      #13
      #14
      #15
      #16
      #17
      #18
      #19
      #20
