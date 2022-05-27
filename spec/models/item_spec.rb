require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do

    context "商品出品ができる場合" do
      it "item_nameとexplanatory、image、category_id、condition_id、delivery_id、prefecture_id、shipping_day_id、priceが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context "商品出品ができない場合" do
      it "item_nameが空では登録できない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "explanatoryが空では登録できない" do
        @item.explanatory = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanatory can't be blank")
      end
      it "imageが空では登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "category_idが空では登録できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "category_idがデフォルト（---）の状態では登録できない" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "condition_idが空では登録できない" do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "condition_idがデフォルト（---）のままでは登録できない" do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "delivery_idが空では登録できない" do
        @item.delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery can't be blank")
      end
      it "delivery_idがデフォルト（---）のままでは登録できない" do
        @item.delivery_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery can't be blank")
      end
      it "prefecture_idが空では登録できない" do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "prefecture_idがデフォルト（---）のままでは登録できない" do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "shipping_day_idが空では登録できない" do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it "shipping_day_idがデフォルト（---）のままでは登録できない" do
        @item.shipping_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it "priceが空では登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが¥300以下では登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は ¥300~9,999,999 の間で半角数字で指定してください")
      end
      it "priceが¥9,999,999以上では登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は ¥300~9,999,999 の間で半角数字で指定してください")
      end
      it "priceは半角数字以外で入力されている場合、登録できない" do
        @item.price = "３０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は ¥300~9,999,999 の間で半角数字で指定してください")
        @item.price = "三千"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は ¥300~9,999,999 の間で半角数字で指定してください")
        @item.price = "さんぜん"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は ¥300~9,999,999 の間で半角数字で指定してください")
      end
      it "userが紐づいていなければ登録できない" do
        @item.user_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end