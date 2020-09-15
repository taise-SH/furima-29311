require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname、last_name、first_name、last_name_kata、first_name_kata、email、password、password_confirmation、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end

      it "first_nameとlast_nameは漢字、ひらがな、カタカナのどれかであれば登録できる" do
        @user.first_name = "ああアア阿阿"
        @user.last_name = "ああアア阿阿"
        expect(@user).to be_valid
      end

      it "first_name_kataとlast_name_kataはカタカナであれば登録できる" do
        @user.first_name_kata = "アアアア"
        @user.last_name_kata = "アアアア"
        expect(@user).to be_valid
      end

      it "passwordが半角英数字混合で6文字以上であれば登録できる" do
        @user.password = "aaaa00"
        @user.password_confirmation = "aaaa00"
        expect(@user).to be_valid
      end
    end
  


    context '新規登録がうまくいかないとき' do
      it "nicknameが空では登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "last_nameが空では登録ができない" do 
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it "first_name_kataが空では登録がでいない" do
        @user.first_name_kata = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kata can't be blank")
      end

      it "first_name_kataがカタカナ以外では登録ができいない" do
        @user.first_name_kata = "あああ嗚呼"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kata is invalid")
      end

      it "last_name_kataが空では登録できない" do
        @user.last_name_kata = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kata can't be blank")
      end

      it "last_name_kataがカタカナ以外では登録ができいない" do
        @user.last_name_kata = "あああ嗚呼"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kata is invalid")
      end

      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "emailに＠がないと登録できない" do
        @user.email = "aaa.aaa.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "birthdayが空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end