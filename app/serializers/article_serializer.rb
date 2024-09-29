class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :slug
end
