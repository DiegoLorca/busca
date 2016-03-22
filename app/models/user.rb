class User < ActiveRecord::Base
  rolify :before_add => :before_add_method
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  #attr_protected :email, :password, :password_confirmation, :title, :asignatura, :address, :telefono, :rut, :remember_me
  # attr_accessible :title, :body
  #validates :password, presence: true
  validates :email, presence: true, uniqueness: true
  validates :title, presence: true
  validates :asignatura, presence: false
  validates :address, presence: false
  validates :telefono, presence: false, length: { maximum: 9 }, length: { minimum: 9 }
  validates :comuna, presence: false
  validates :precio, presence: false
  validates :tipo, presence: true
  validates :rut, rut: true, presence: false

  #Para las imagenes
  has_attached_file :cover, style: { thumb: "250x200", mini: "50x50" }
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/

  #Para los CV, aun no le pongo el style para las dimensiones del archivo
  has_attached_file :attachment
  validates_attachment_content_type :attachment, :content_type =>  ['application/msword','applicationvnd.ms-word','applicaiton/vnd.openxmlformats-officedocument.wordprocessingm1.document']

  scope :unreleased, where(:released_at => nil)

  has_many :forums
  has_many :teachers
  def name_with_initial
    "#{title}. #{tipo}"
  end

  def sum
    (self.precio * 2)
  end

  #def before_add_method(role)
    # do something before it gets added
  #  user = User.find(1)
  #  user.remove_role :admin
  #  => true # if user previously had an admin role
  #end

end
