class Forum < ActiveRecord::Base
	  
	belongs_to :user
	
	validates :slogan, presence: true, uniqueness: true
	validates :presentacion, presence: true, length: { maximum: 250 }
	validates :hora, presence: false
	before_save :set_visits_count

	def update_visits_count
		self.update(visits_count: self.visits_count + 1)
	end

	private
	def set_visits_count
		self.visits_count ||= 0
	end
end
