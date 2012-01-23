require 'rho/rhocontroller'
require 'helpers/browser_helper'
require 'helpers/employee_helper'

class EmployeeController < Rho::RhoController
  include BrowserHelper
  include EmployeeHelper

  # GET /Employee
  def index
    @employees = Employee.find(:all)
    render :back => '/app'
  end

  # GET /Employee/{1}
  def show
    @employee = Employee.find(@params['id'])
    if @employee
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Employee/new
  def new
    @employee = Employee.new
    @companies = Company.find(:all)
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Employee/{1}/edit
  def edit
    @employee = Employee.find(@params['id'])
    if @employee
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Employee/create
  def create
    @employee = Employee.create(@params['employee'])
    redirect :action => :index
  end

  # POST /Employee/{1}/update
  def update
    @employee = Employee.find(@params['id'])
    @employee.update_attributes(@params['employee']) if @employee
    redirect :action => :index
  end

  # POST /Employee/{1}/delete
  def delete
    @employee = Employee.find(@params['id'])
    @employee.destroy if @employee
    redirect :action => :index  
  end

  def employee_details
    @employees = Employee.find(:all)
  end

  def filter_employee_form
    @companies = Company.find(:all)
  end

  def filter_employee_result
    @employees = Employee.find(:all, :conditions =>{'gender' => @params['gender'],'company_id'=> @params['company_id']})
  end



end
