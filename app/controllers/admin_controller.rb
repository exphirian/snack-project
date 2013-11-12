#encoding: utf-8
class AdminController < ApplicationController

	before_filter :admin
	def index
		
	end

	def create_category
		@category = Category.new(params[:category])
		if @category.save
			redirect_to liste_categories_path
		end
	end

	def edit_article
		@article = Article.find(params[:id])
		@categories = Category.all
	end

	def update_article
		@article = Article.find(params[:id])
		if @article.update_attributes(params[:article])
			redirect_to :action => "articles_by_category", :id => @article.category_id
		end
	end

	def create_article
		@article = Article.new(params[:article])
		if @article.price == nil
			@article.price = 0
		end
		if @article.save
			redirect_to liste_articles_path
		end
		@categories = Category.all
	end

	def articles_by_category
		@category = Category.find(params[:id])
	end

	def commandes_liste
		@commandes = Commande.order(:hour_id).all
		@pretes = []
		@non_pretes = []
		@commandes.each do |c|
			if c.user_ready == true && c.ready == true && c.payee == false
				@pretes << c
			elsif c.user_ready == true && c.ready == false && c.payee == false
				@non_pretes << c
			end
		end
	end

	def liste_articles
		@articles = Article.all
		@base_article = []
		@articles.each do |a|
			if a.commande_id == nil
				@base_article << a
			end
		end
		@categories = Category.all
		@article = Article.new
	end

	def liste_categories
		@categories = Category.all
		@category = Category.new
	end

	def valider_commande
		@commande = Commande.find(params[:id])
		@commande.ready = true
		@commande.save
		redirect_to commandes_liste_path
	end

	def commande_payee
		@commande = Commande.find(params[:id])
		@commande.payee = true
		@commande.save
		@hour = @commande.hour
		@hour.destroy
		redirect_to commandes_liste_path
	end

	def delete_article
		@article = Article.find(params[:id])
		@article.delete
		@article.save
		redirect_to :action => "articles_by_category", :id => @article.category_id
	end

	def delete_category
		@category = Category.find(params[:id])
		@category.delete
		@category.save
		redirect_to :action => "liste_categories", :id => @category.id
	end

	def edit_category
		@category = Category.find(params[:id])
	end

	def update_category
		@category = Category.find(params[:id])
		if @category.update_attributes(params[:category])
			redirect_to :action => "liste_categories", :id => @category.id
		end
	end

	def hour_form
		@user = current_user
	end

	def create_hour
		@user = current_user
		@user.update_attributes(params[:user])
		@hours = Hour.find_all_by_user_id(@user.id)
		@hours.each do |h|
			h.destroy
		end
		@sh = @user.start_hour
		@eh = @user.end_hour + 15.minutes
		until @sh >= @eh
			h = Hour.new
			h.hour = @sh
			h.user = @user
			h.save
			@sh += @user.intervalle.minutes
		end
		redirect_to admin_path
	end

	def sauce_liste
		@categories = Category.all
		@sauces = Sauce.all
		@sauce = Sauce.new
	end

	def create_sauce
		@sauce = Sauce.new(params[:sauce])
		if @sauce.save
			if @sauce.name == ""
				@sauce.destroy
			end
			redirect_to sauce_liste_path
		end
	end
end
