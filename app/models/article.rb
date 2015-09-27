class Article < ActiveRecord::Base
	belongs_to :user
	# La tabla => articles
	# Campos => article.title() => 'El titulo Articulo'
	# Escribir metodos
	validates :title, presence: true, uniqueness: true
	validates :body, presence: true, length: {minimum: 10}
	#validates :username, format: {with: /regex/}
	before_save :set_visit_count

	def update_visit_count
		#self.save if self.visit_count.nil?
		self.update(visit_count: self.visit_count + 1)
	end

	private

	def set_visit_count
		#self.visit_count = 0
		self.visit_count ||= 0
	end
end
