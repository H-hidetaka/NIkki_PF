# require 'rails_helper'

# RSpec.describe Users, type: :system do
#   it "認証されたか" do
#     expect(FactoryBot.create(:user)).to be_valid
#     user.valid?
#     expect(user.errors[:name]).to include("can't be blank")
#   end

#   it "emailがない場合は登録できないこと" do
#     user = build(:user, email: "")
#     user.valid?
#     expect(user.errors[:email]).to iunclude("can't be blank")
#   end

#   it "passwordがない場合は登録できない" do
#     user = build(:user, password: "")
#     user.valid?
#     expect(user.errors[:email]).to iunclude("can't be blank")
#   end

#   it "password_confirmationがない場合は登録できない" do
#     user = build(:user, password_confirmation: "")
#     user.valid?
#     expect(user.errors[:email]).to iunclude("can't be blank")
#   end
# end

# # require 'rails_helper'

# # RSpec.describe 'LoginUser', type: :system do
# #   let(:user) { create :user }
# #   describe 'ログイン画面表示' do
# #     context 'ログイン画面に、パスワードとメールアドレスを記入' do
# #       it '正常に表示される' do
# #         login(user)
# #         click_link 'ログイン'
# #         visit login_path
# #         fill_in 'メールアドレス', with: 'メールアドレス'
# #         fill_in 'パスワード', with: 'パスワード'
# #         click_button('ログイン')
# #         switch_to_window(windows.last)
# #         expect(page).not_to have_content("Nil location provided. Can't build URI"), 'エラーページが表示されています'
# #         expect(page).to have_content('ログイン), 'プレビューページが正しく表示されていません'
# #       end
# #     end
# #   end
# # end
