require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '新規登録出来る時' do
      it '全ての項目が入力されていれば登録出来る' do
        expect(@item).to be_valid
      end
    end
    context '新規登録できない時' do
      it '商品画像がなければ登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it '商品名がなければ登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Title can't be blank"
      end
      it '商品の説明がなければ登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end
      it 'カテゴリーがなければ登録できない' do
        @item.category_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 0"
      end
      it '商品の状態の情報がなければ登録できない' do
        @item.status_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include "Status must be other than 0"
      end
      it '配送料の負担についての情報がなければ登録できない' do
        @item.delivery_fee_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery fee must be other than 0"
      end
      it '発送元の地域についての情報がなければ登録できない' do
        @item.prefecture_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture must be other than 0"
      end
      it '発送までの日数についての情報がなければ登録できない' do
        @item.delivery_days_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery days must be other than 0"
      end
      it '販売価格についての情報がなければ登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is invalid"
      end
      it '販売価格が¥299以下だと登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '販売価格が¥10,000,000以上だと登録できない' do
        @item.price = '10000000'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it '販売価格に全角数字が含まれていると保存できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end