class Article < ApplicationRecord
    has_rich_text :content
    belongs_to :user
    has_many :has_categories
    has_many :categories, through: :has_categories
    attr_accessor :category_elements

    def save_categories
        #category elements 1,2,3,4,5
        #Iterar el arreglo
        return has_categories.destroy_all if category_elements.nil? || category_elements.empty?
        has_categories.where.not(category_id: category_elements).destroy_all 
        category_elements.each do |category_id|
            #Crear HasCategory HasCategory<article_id: 1, category_id: 2
            #En caso de que no este lo crea (evitar duplicidad)
            HasCategory.find_or_create_by(article: self, category_id: category_id)
        end
    end

end
