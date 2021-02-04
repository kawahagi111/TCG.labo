require 'rails_helper'

RSpec.describe Tweet, type: :model do
  
  before do
    @tweet = FactoryBot.build(:tweet)
  end
  describe 'ツイートの保存' do
    context 'ツイートが保存できる場合' do
      it '全てが揃っていれば保存される' do
        expect(@tweet).to be_valid
      end
    end
    context 'ツイートが保存できない場合' do
      it 'タイトルなしでは保存できない' do
        @tweet.title = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include "Title can't be blank"
      end
      it '説明なしでは保存できない' do
        @tweet.concept = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include "can't be blank"
      end
      it 'imageが空では保存されない' do
        @tweet.image = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
