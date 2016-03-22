class TeachersController < ApplicationController
	before_action :authenticate_user!
	#GET /teachers
	def index
		#Obtiene todos los registros de la tabla que corresponde al modelo Teacher SELECT * FROM teachers
		@teachers = Teacher.all
		@teachers_by_date = @teachers.group_by(&:published_on)
		@date = params[:date] ? Date.parse(params[:date]) : Date.today
	end
	#GET /teachers/:id
	def show
		#Encuentra un registro por su ID
		@teacher = Teacher.find(params[:id])
		#Where
		#Article.where("id = ? AND title = ? ", params[:id], params[:title]) - Esto nos sirve para un buscador porque lo buscara por su titulo -
	end
	#GET /teachers/new
	def new
		@teacher = Teacher.new
	end

	def edit
		@teacher = Teacher.find(params[:id])
	end
	#POST /teachers
	def create
		#INSERT INTO
		@teacher = Teacher.new(teacher_params)
		if @teacher.save
			redirect_to @teacher, notice: "Fecha creada."
		else
			render :new
		end
	end
	#DELETE /teachers/:id
	def destroy
		#DELETE FROM teachers
		@teacher = Teacher.find(params[:id])
		@teacher.destroy #Destroy elimina el objeto de la BD
		redirect_to teachers_path, notice: "Fecha eliminada."
	end
	#PUT /teachers/:id
	def update
		#UPDATE
		#@teacher.update_attributes({title: 'Nuevo titulo'})
		@teacher = Teacher.find(params[:id])
		if @teacher.update(teacher_params)
			redirect_to @teacher, notice: "Fecha actualizada."
		else
			render :edit
		end
	end
	private
	def teacher_params
		params.require(:teacher).permit(:user_id,:published_on,:content)
	end
end