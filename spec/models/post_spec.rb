require 'rails_helper'

RSpec.describe Post, type: :model do
  let!(:post_yesterday) { create(:post, :yesterday) }
  let!(:post_one_week_ago) { create(:post, :one_week_ago) }
  let!(:post_one_month_ago) { create(:post, :one_month_ago) }
  let!(:post) { create(:post) }

  context "バリデーション" do
    it "有効な状態であること" do
      expect(post).to be_valid
    end

    it "名前がなければ無効な状態であること" do
      post = build(:post, name: nil)
      post.valid?
      expect(post.errors[:name]).to include("を入力してください")
    end

    it "名前が30文字以内であること" do
      post = build(:post, name: "あ" * 31)
      post.valid?
      expect(post.errors[:name]).to include("は30文字以内で入力してください")
    end

    it "説明が140文字以内であること" do
      post = build(:post, description: "あ" * 141)
      post.valid?
      expect(post.errors[:description]).to include("は140文字以内で入力してください")
    end

    it "ユーザーIDがなければ無効な状態であること" do
      post = build(:post, user_id: nil)
      post.valid?
      expect(post.errors[:user_id]).to include("を入力してください")
    end
  end

  context "並び順" do
    it "最も最近の投稿が最初の投稿になっていること" do
      expect(post).to eq Post.first
    end
  end
end
