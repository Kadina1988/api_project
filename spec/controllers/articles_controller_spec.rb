require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe "#index" do 
    subject { get :index }
    it "should return response :ok" do 
      subject
      expect(response).to have_http_status(:ok)
    end

    it 'should return proper list articles' do 
      articles = create_list(:article, 4)
      subject
      expect(json_data.length).to eq(4)
      articles.each_with_index do |article, index|
        expect(json_data[index]["attributes"]).to eq({
          "title" => article.title,
          "body" => article.body,
          "slug" => article.slug
        })
      end
    end
  end
end
