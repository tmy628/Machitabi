require 'rails_helper'

RSpec.describe 'Postモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { post.valid? }

    let(:user) { create(:user) }
    let!(:post) { build(:post, user_id: user.id) }

    context 'imageカラム' do
      it '空欄でないこと' do
         post.title = ''
         is_expected.to eq false
      end
    end

    context 'titleカラム' do
      it '空欄でないこと' do
        post.title = ''
        is_expected.to eq false
      end
    end

    context 'captionカラム' do
      it '空欄でないこと' do
        post.caption = ''
        is_expected.to eq false
      end
      it '200文字以下であること: 200文字は〇' do
        post.caption = Faker::Lorem.characters(number: 200)
        is_expected.to eq true
      end
      it '200文字以下であること: 201文字は×' do
        post.caption = Faker::Lorem.characters(number: 201)
        is_expected.to eq false
      end
    end

    context 'addressカラム' do
      it '空欄でないこと' do
        post.address = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Book.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'Spotモデルとの関係' do
      it '1:1となっている' do
        expect(User.reflect_on_association(:spot).macro).to eq :has_one
      end
    end

    context 'TagMapモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:tag_maps).macro).to eq :has_many
      end
    end

    context 'Tagモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:tags).macro).to eq :has_many
      end
    end

    context 'Likeモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:likes).macro).to eq :has_many
      end
    end
  end
end