require 'spec_helper'

describe Employee do
  def employee
    Employee.new
  end
  
  def employee_attributes
    {
      :email => "Bine@gmail.com", 
      :salary => 20000.00,
      :rank => 2,
      :flag => true
    }
  end
  
  before(:each) do
    @employee = employee
  end

  it "should be valid" do
    @employee.attributes = employee_attributes
    expect be_valid
  end
  
  it "should require email" do
    @employee.attributes = employee_attributes.except(:email)
    @employee.should have(3).errors_on(:email)
  end

  it "should require email greater than 6 characters" do
    @employee.attributes = employee_attributes
    @employee.email = 'ad'
    @employee.should have(2).error_on(:email)
  end

  it "should require salary" do
    @employee.attributes = employee_attributes.except(:salary)
    @employee.should have(3).errors_on(:salary)
  end

  it "should require salary as integer" do
    @employee.attributes = employee_attributes
    @employee.email = 'tt'
    @employee.should have(2).error_on(:salary)
  end
  it "should require rank" do
    @employee.attributes = employee_attributes.except(:rank)
    @employee.should have(3).errors_on(:email)
  end

  it "should require salary as integer" do
    @employee.attributes = employee_attributes
    @employee.email = 'bbs'
    @employee.should have(2).error_on(:rank)
  end
  
  it "should require unique email" do
    @employee.attributes = employee_attributes
    @employee.email = 'sachin@mdih.com'
    @employee.should have(1).error_on(:email)
  end

  it "should require email with proper format" do
    @employee.attributes = employee_attributes
    @employee.email = 'sachingmal'
    @employee.should have(1).error_on(:email)
  end
end
