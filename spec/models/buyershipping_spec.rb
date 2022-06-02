require 'rails_helper'

RSpec.describe Buyershipping, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buyer_shipping = FactoryBot.build( :Buyershipping, user_id: user.id , item_id: item.id)
  end

  describe '商品購入機能' do
    context '購入出来る時' do
      it '全ての項目が入力されていれば購入出来る' do
        expect(@buyer_shipping).to be_valid
      end
      it '建物名が空でも購入できる' do
        @buyer_shipping.building = ''
        expect(@buyer_shipping).to be_valid
      end
    end
    context '商品購入できない時' do
      it '郵便番号がなければ購入できない' do
        @buyer_shipping.postal_code = ''
        @buyer_shipping.valid?
        expect(@buyer_shipping.errors.full_messages).to include "Postal code can't be blank"
      end
      it '都道府県の情報がなければ購入できない' do
        @buyer_shipping.prefecture_id = '0'
        @buyer_shipping.valid?
        expect(@buyer_shipping.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '市区町村の情報がなければ購入できない' do
        @buyer_shipping.city = ''
        @buyer_shipping.valid?
        expect(@buyer_shipping.errors.full_messages).to include "City can't be blank"
      end
      it '番地の情報がなければ購入できない' do
        @buyer_shipping.address = ''
        @buyer_shipping.valid?
        expect(@buyer_shipping.errors.full_messages).to include "Address can't be blank"
      end
      it '電話番号の情報がなければ購入できない' do
        @buyer_shipping.telephone = ''
        @buyer_shipping.valid?
        expect(@buyer_shipping.errors.full_messages).to include "Telephone can't be blank"
      end
      it 'クレジットカードについての情報がなければ購入できない' do
        @buyer_shipping.token = ''
        @buyer_shipping.valid?
        expect(@buyer_shipping.errors.full_messages).to include "Token can't be blank"
      end
      it '郵便番号にハイフンがないと購入できない' do
        @buyer_shipping.postal_code = '1234567'
        @buyer_shipping.valid?
        expect(@buyer_shipping.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end
      it '電話番号が数値でないと登録できない' do
        @buyer_shipping.telephone = '３００'
        @buyer_shipping.valid?
        expect(@buyer_shipping.errors.full_messages).to include('Telephone is not a number')
      end
      it '電話番号が12文字以上は登録できない' do
        @buyer_shipping.telephone = '090123456789'
        @buyer_shipping.valid?
        expect(@buyer_shipping.errors.full_messages).to include('Telephone is too long (maximum is 11 characters)')
      end
      it 'userが紐付いていなければ購入できない' do
        @buyer_shipping.user_id = nil
        @buyer_shipping.valid?
        expect(@buyer_shipping.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていなければ購入できない' do
        @buyer_shipping.item_id = nil
        @buyer_shipping.valid?
        expect(@buyer_shipping.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end