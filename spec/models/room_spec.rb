require 'rails_helper'

RSpec.describe Room, type: :model do
  describe '#create' do
    before do
      @room = FactoryBot.build(:room)
    end

    it 'nameの値が存在すれば登録できること' do
      expect(@room).to be_valid
    end

    it 'nameが空では登録できないこと' do
      @room.name = ''
      @room.valid?
      expect(@room.errors.full_messages).to include("Name can't be blank")
    end
  end
end

RSpec.describe 'ユーザーログイン機能', type: :system do
  it 'ログインしていない状態でトップページにアクセスした場合、サインインページに移動する' do
    # トップページに遷移する
    visit root_path
    # ログインしていない場合、サインインページに遷移していることを確認する
    expect(currendt_path).to eq(new_user_session_path)
  end

  it 'ログインに成功し、トップページに遷移する' do
    # 予め、ユーザーをDBに保存する

    # サインインページへ移動する

    # ログインしていない場合、サインインページに遷移していることを確認する

    # すでに保存されているユーザーのemailとpasswordを入力する

    # ログインボタンをクリックする

    # トップページに遷移していることを確認する

  end

  it 'ログインに失敗し、再びサインインページに戻ってくる' do
    # 予め、ユーザーをDBに保存する

    # トップページに遷移する

    # ログインしていない場合、サインインページに遷移していることを確認する

    # 誤ったユーザー情報を入力する

    # ログインボタンをクリックする

    # サインインページに戻ってきていることを確認する

  end
end