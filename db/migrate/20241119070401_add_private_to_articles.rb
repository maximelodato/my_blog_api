# db/migrate/xxxxxx_add_private_to_articles.rb

class AddPrivateToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :private, :boolean, default: false
  end
end
