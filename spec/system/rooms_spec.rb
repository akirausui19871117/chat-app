require 'rails_helper'

RSpec.describe 'チャットルームの削除機能', type: :system do
  before do
    @room_user = FactoryBot.create(:room_user)
  end

  it 'チャットルームを削除すると、関連するメッセージがすべて削除されていること' do
    # サインインする
    sign_in(@room_user.user)

    # 作成されたチャットルームへ遷移する
    click_on(@room_user.room.name)
    prefecture = ['北海道', '青森', '...(省略)...', '沖縄']

    def select_prefecture(prefecture, category)
      num = gets.to_i
      if category == 'birthplace'
        birthplace = prefecture[num]
        puts birthplace
      elsif category == 'address'
        address = prefecture[num]
        puts address
      elsif category == 'work_address'
        work_address = prefecture[num]
        puts work_address
      end
    end
    
    puts 
    
    
    select_prefecture(prefecture, 'birthplace')
    select_prefecture(prefecture, 'address')
    select_prefecture(prefecture, 'work_address')prefecture = ['北海道', '青森', '...(省略)...', '沖縄']

    def select_prefecture(prefecture, category)
      num = gets.to_i
      if category == 'birthplace'
        birthplace = prefecture[num]
        puts birthplace
      elsif category == 'address'
        address = prefecture[num]
        puts address
      elsif category == 'work_address'
        work_address = prefecture[num]
        puts work_address
      end
    end
    
    puts 
    
    
    select_prefecture(prefecture, 'birthplace')
    select_prefecture(prefecture, 'address')
    select_prefecture(prefecture, 'work_address')prefecture = ['北海道', '青森', '...(省略)...', '沖縄']

    def select_prefecture(prefecture, category)
      num = gets.to_i
      if category == 'birthplace'
        birthplace = prefecture[num]
        puts birthplace
      elsif category == 'address'
        address = prefecture[num]
        puts address
      elsif category == 'work_address'
        work_address = prefecture[num]
        puts work_address
      end
    end
    
    puts 
    
    
    select_prefecture(prefecture, 'birthplace')
    select_prefecture(prefecture, 'address')
    select_prefecture(prefecture, 'work_address')
    # メッセージ情報を5つDBに追加する
    FactoryBot.create_list(:message, 5, room_id: @room_user.room.id, user_id: @room_user.user.id)

    # 「チャットを終了する」ボタンをクリックすることで、作成した5つのメッセージが削除されていることを確認する
    expect {
      find_link('チャットを終了する',  href: room_path(@room_user.room)).click
    }.to change { @room_user.room.messages.count }.by(-5)

    # トップページに遷移していることを確認する
    expect(current_path).to eq(root_path)
  end
end