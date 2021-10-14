require 'rails_helper'

RSpec.describe ItemForm, type: :model do
  describe '商品の購入' do
    before do
      @item_form = FactoryBot.build(:item_form)
    end
    context '商品購入がうまくいく時' do
      it '全ての情報が正しく入力された時に購入できる' do
        expect(@item_form).to be_valid
      end

      it 'buildingが空でも購入できる' do
        @item_form.building = ''
        expect(@item_form).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'postal_codeが空だと購入できない' do
        @item_form.postal_code = ''
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンが入っていないと購入できない' do
        @item_form.postal_code = '0009999'
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'postal_codeが全角数字だと購入できない' do
        @item_form.postal_code = '０００-００００'
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'area_idが1だと購入できない' do
        @item_form.area_id = 1
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Area can't be blank")
      end
      it 'address_lineが空だと購入できない' do
        @item_form.address_line = ''
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Address line can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @item_form.phone_number = ''
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが全角数字だと購入できない' do
        @item_form.phone_number = '０９０３３３３５５５５'
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberにハイフンが入ると購入できない' do
        @item_form.phone_number = '080-12345678'
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが11桁を超えると購入できない' do
        @item_form.phone_number = '080123456789'
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      it 'tokenが空だと購入できない' do
        @item_form.token = ''
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
