class Teacher < ActiveRecord::Base
	belongs_to :user
	#la tabla=>teachers
	#campos=>teacher.fecha()=>'La fecha'
	#escribir metodos
	#attr_accessible :name, :published_on, :content #, presence: true, length: { maximum: 34 }
	#validates :published_on , presence: true, length: { maximum: 13 } #uniqueness: true - esto es para que no e repita, ejemplo no se repita la misma hora el mismo dia
	#validates :content , presence: true, length: { minimum: 20 }
	#validates :username, format: { with: /regex/ } - si queremos validar con expresiones regulares el formato
	#validates :name, presence: true
	validates :content, presence: true, length: { maximum: 250 }

	scope :unreleased, where(:released_at => nil)

end
