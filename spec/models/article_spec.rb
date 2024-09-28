require 'rails_helper'

RSpec.describe Article, type: :model do
  describe "#validation" do 
    it 'should be validation article' do 
      article = build :article
      expect(article).to be_valid 
    end

    it 'should not to be valid with empty title' do 
      article = build(:article, title: '')
      expect(article).not_to be_valid
      expect(article.errors.messages[:title]).to include("can't be blank")
    end

    it 'should not be valid with empty body' do 
      article = build(:article, body: '')
      expect(article).not_to be_valid 
    end

    it 'should not be valid with not uniquenes slug' do 
      valid_article = create(:article)
      invalid_article = build(:article, slug: valid_article.slug)
      expect(invalid_article).not_to be_valid 
    end

    it 'should not be valid with precense ' do 
      article = build(:article, slug: '')
      expect(article).not_to be_valid
    end
  end
end
