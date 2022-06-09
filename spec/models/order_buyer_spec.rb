require 'rails_helper'

RSpec.describe OrderBuyer, type: :model do
  describe '商品購入' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_buyer = FactoryBot.build(:order_buyer, user_id: @user.id, item_id: @item.id)
      sleep(0.01)
    end

    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_buyer).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_buyer.building_name = ''
        expect(@order_buyer).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_buyer.postal_code = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_buyer.postal_code = "1231234"
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @order_buyer.prefecture_id = 0
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalitiesが空だと保存できないこと' do
        @order_buyer.municipalities = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @order_buyer.address = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_numberが空だと保存できないこと' do
        @order_buyer.telephone_number = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberでハイフンを含んだ形式だと保存ができないこと' do
        @order_buyer.telephone_number = '090-1234-1234'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Telephone number は半角数字のみ、ハイフンなしで入力して下さい")
      end
      it 'user_idが空だと保存ができないこと' do
        @order_buyer.user_id = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存ができないこと' do
        @order_buyer.item_id = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では保存ができないこと' do
        @order_buyer.token = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
