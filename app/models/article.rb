class Article < ActiveRecord::Base
	belongs_to :user
	# La tabla => articles
	# Campos => article.title() => 'El titulo Articulo'
	# Escribir metodos
	validates :title, presence: true, uniqueness: true
	validates :body, presence: true, length: {minimum: 10}
	#validates :username, format: {with: /regex/}
end
