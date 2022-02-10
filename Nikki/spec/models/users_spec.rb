require 'rails_helper'

describe User do
  describe '#create' do
  let(:user) { create(:user) }
    #1
    it "nameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    #2
    it "nameがない場合は登録できないこと" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    #3
    it "emailがない場合は登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    #4
    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end

    #5
    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません", "を入力してください")
    end

    #6
    it "nameが17文字以上であれば登録できないこと" do
      user = build(:user, name: "aiueoaiueoaiueo17")
      user.valid?
      expect(user.errors[:name]).to include("は16文字以内で入力してください")
    end

    #7
    it "nameが2文字以下では登録できない" do
      user = build(:user, name: "ab")
      user.valid?
      expect(user.errors[:name]).to include("は3文字以上で入力してください")
    end

    #8
    it "重複したemailが存在する場合登録できないこと" do
      user1 = build(:user, email: "testman@test")
      user2 = build(:user, email: "testman@test")
      user2.valid?
      expect(user2.errors[:email]).to include("")
    end

    #9
    it "passwordが6文字以上であれば登録できること" do
      user = build(:user, password: "123456", password_confirmation: "123456")
      expect(user).to be_valid
    end

    #10
    it "passwordが5文字以下であれば登録できないこと" do
      user = build(:user, password: "12345", password_confirmation: "12345")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end
  end
end
