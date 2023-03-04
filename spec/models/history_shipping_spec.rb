require 'rails_helper'

RSpec.describe HistoryShipping, type: :model do

  before do
    @history_shipping = FactoryBot.build(:history_shipping)
  end
  describe '出品商品の購入' do
    context '商品が購入できる時' do
      it '全ての値が正しく入力されていれば購入できる' do
        expect(@history_shipping).to be_valid
      end
      it 'ログイン状態のユーザーのみ商品購入ページへ遷移できること' do
        expect(@history_shipping).to be_valid
      end
      it '建物名は任意であること' do
        @history_shipping.building = ''
        expect(@history_shipping).to be_valid
      end
    end

    context '商品が購入できない時' do
      it 'userが紐付いていなければ購入できない' do
        @history_shipping.user_id = nil
        @history_shipping.valid?
        expect(@history_shipping.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていなければ購入できない' do
        @history_shipping.item_id = nil
        @history_shipping.valid?
        expect(@history_shipping.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が必須である' do
        @history_shipping.postal_code = ''
        @history_shipping.valid?
        expect(@history_shipping.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @history_shipping.postal_code = '1234567'
        @history_shipping.valid?
        expect(@history_shipping.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県が必須であること' do
        @history_shipping.prefecture_id = 1
        @history_shipping.valid?
        expect(@history_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が必須であること' do
        @history_shipping.city = ''
        @history_shipping.valid?
        expect(@history_shipping.errors.full_messages).to include("City can't be blank")
  
      end
      it '番地が必須であること' do
        @history_shipping.address = ''
        @history_shipping.valid?
        expect(@history_shipping.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が必須であること' do
        @history_shipping.telephone = ''
        @history_shipping.valid?
        expect(@history_shipping.errors.full_messages).to include("Telephone can't be blank")
      end
      it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと' do
        @history_shipping.telephone = '090-1234-5678'
        @history_shipping.valid?
        expect(@history_shipping.errors.full_messages).to include("Telephone can't be blank")
      end
    end
  end
end
