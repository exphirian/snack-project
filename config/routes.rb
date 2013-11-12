SnackPrroject::Application.routes.draw do
  devise_for :users
	
	root :to => 'welcome#index'

  match 'admin' => 'admin#index'
  match 'new_category' => 'admin#new_category'
  match 'create_category' => 'admin#create_category'
  match 'create_article' => 'admin#create_article'
  match 'available_article' => 'admin#available_article'
  match 'commandes_liste' => 'admin#commandes_liste'
  match 'create_hour' => 'admin#create_hour'
  match 'liste_articles' => 'admin#liste_articles'
  match 'liste_categories' => 'admin#liste_categories'
  match 'articles_by_category/:id' => 'admin#articles_by_category'
  match 'edit_article/:id' => 'admin#edit_article'
  match 'update_article/:id' => 'admin#update_article'
  match 'valider_commande/:id' => 'admin#valider_commande'
  match 'commande_payee/:id' => 'admin#commande_payee'
  match 'total/:id' => 'admin#total'
  match 'delete_article/:id' => 'admin#delete_article'
  match 'edit_category/:id' => 'admin#edit_category'
  match 'delete_category/:id' => 'admin#delete_category'
  match 'update_category/:id' => 'admin#update_category'
  match 'parametre' => 'admin#hour_form'
  match 'sauce_liste' => 'admin#sauce_liste'
  match 'create_sauce' => 'admin#create_sauce'

  match 'articles_informations/:id' => 'welcome#articles_informations'
  match 'nom_commande' => 'welcome#nom_commande'
  match 'create_commande' => 'welcome#create_commande'
  match 'ajout_article/:id' => 'welcome#add_article'
  match 'plus_article/:id' => 'welcome#plus_article'
  match 'validate_commande/:id' => 'welcome#validate_commande'
  match 'mes_commandes' => 'welcome#archives_commande'
  match 'add_sauce/:id' => 'welcome#add_sauce'
  match 'remove_article/:id' => 'welcome#delete_article_from_commande'

end
