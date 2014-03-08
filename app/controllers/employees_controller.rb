class EmployeesController < ApplicationController
  #GET employees/
  def index
    @employees = Employee.all
  end
  
  #GET employees/new
  def new
    @employee = Employee.new
  end
  
  #POST /employees/
  def create
    @employee = Employee.new(params_employee)
    if @employee.save
      expire_fragment
      flash[:notice] = "Employee created sucessfully."
      redirect_to employees_path
    else
      render 'new'
    end
  end
  
  #GET /employees/:id
  def show
    @employee = Employee.find(params[:id])
  end
  
  private
  def params_employee
    params.require(:employee).permit!
  end
end
