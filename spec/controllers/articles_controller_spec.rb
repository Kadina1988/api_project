require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe "#index" do 
    subject { get :index }
    
    it "should return response :ok" do 
      subject
      expect(response).to have_http_status(:ok)
    end

    it 'should return proper list articles' do 
      create_list(:article, 4)
      subject
      expect(json_data.length).to eq(4)
      Article.recent.each_with_index do |article, index|
        expect(json_data[index]["attributes"]).to eq({
          "title" => article.title,
          "body" => article.body, 
          "slug" => article.slug 
        })
      end
    end

    it "should return articles in the proper order" do 
      oldest_article = create(:article, title: "old") 
      newer_article = create(:article)
      subject
      expect(json_data.first["id"]).to eq(newer_article.id.to_s)
    end

    it 'should return one article on page' do
      create_list(:article, 3) 
      get :index, params: { page: 2, per: 1 }
      expect(json_data.length).to eq(1)
      article_id = Article.recent.second.id.to_s
      expect(json_data.first["id"]).to eq(article_id)
    end
  end
end
