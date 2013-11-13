#encoding: utf-8
class WelcomeController < ApplicationController

	def index
		@categories = Category.all
	end

	def articles_informations
		@article = Article.find(params[:id])
	end

	def nom_commande
		if Hour.count < 1
			redirect_to root_path
			flash[:notice] = "Aucune heure disponible"
		end
		if user_signed_in?
			@user = current_user
		end
		@hours = []
		Hour.all.each do |h|
			if h.commandes.count < User.find_by_admin(true).commande_max
				if h.hour.hour > Time.now.hour
					if h.hour.min > Time.now.min
						@hours << h
					end
				end
			end
		end
		@commande = Commande.new
	end

	def create_commande
		@commande = Commande.new(params[:commande])
		if @commande.save
			if user_signed_in?
				@commande.user = current_user
			end
			@commande.save
			redirect_to :action => "add_article", :id => @commande.id
		end
	end

	def add_article
		@commande = Commande.find(params[:id])
		@articles = Article.all
		@good_articles = []
		@articles.each do |a|
			if a.commande_id == nil
				@good_articles << a
			end
		end
		@sauces = Sauce.all
	end

	def plus_article
		@commande = Commande.find(params[:id])
		@commande.update_attributes(params[:commande])
		@article = Article.find(@commande.add_id)
		@new_article = Article.new
		@new_article.name = @article.name
		@new_article.price = @article.price
		@new_article.category = @article.category
		@new_article.attachment = @article.attachment
		@new_article.description = @article.description
		@new_article.commande = @commande
		@new_article.save
		redirect_to :action => "add_article", :id => @commande.id
	end

	def validate_commande
		@commande = Commande.find(params[:id])
		@commande.user_ready = true
		@commande.save
		redirect_to root_path, :notice => "Commande validée"
	end

	def archives_commande
		@commandes = current_user.commandes
	end

	def add_sauce
		@article = Article.find(params[:id])
		@article.update_attributes(params[:article])
		redirect_to :action => "add_article", :id => @article.commande_id
	end

	def delete_article_from_commande
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to :action => "add_article", :id => @article.commande_id
	end
end