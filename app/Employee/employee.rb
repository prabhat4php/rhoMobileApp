# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
class Employee
  include Rhom::PropertyBag

  # Uncomment the following line to enable sync with Employee.
  # enable :sync

  #add model specifc code here

  belongs_to :company_id, 'Company'
end
