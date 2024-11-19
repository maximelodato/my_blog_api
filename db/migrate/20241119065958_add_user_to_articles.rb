class AddUserToArticles < ActiveRecord::Migration[7.0]
  def change
    # Ajouter la référence sans la contrainte NOT NULL
    add_reference :articles, :user, foreign_key: true

    # Mettre à jour les articles existants avec un utilisateur par défaut (ajustez l'ID en fonction de vos données)
    default_user = User.first || User.create(email: 'default@example.com', password: 'password')
    Article.update_all(user_id: default_user.id)

    # Ajouter la contrainte NOT NULL après avoir peuplé la colonne
    change_column_null :articles, :user_id, false
  end
end
