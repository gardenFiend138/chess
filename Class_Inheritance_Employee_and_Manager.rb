class Employee
attr_reader :salary

  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    # @boss.employees << self if boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end

end

class Manager < Employee
attr_accessor :employees

  def initialize(name, title, salary, boss = nil)
    @employees = []
    super
  end

  def bonus(multiplier)
    bonus = 0

    @employees.each do |sub_emp|
      if sub_emp.is_a?(Manager)
        sub_emp.employees.each do |sub_sub_emp|
          bonus += sub_sub_emp.salary
        end
        bonus += sub_emp.salary
      else
        bonus += sub_emp.salary
      end
    end
    bonus *= multiplier
  end

#   def total_salary
#     return self.salary if self.class != Manager
#     bonus = 0
#     @employees.each do |sub_employee|
#       if sub_employee.is_a?(Manager)
#         bonus + sub_employee.total_salary
#       else
#         bonus += sub_employee.salary
#       end
#     end
#
#     bonus
#   end
#
# end

ned = Manager.new("Ned", "Founder", 1000000)
darren = Manager.new("Darren", "TA Manager", 78000, "Ned")
shawna = Employee.new("Shawna", "TA", 12000, "Darren")
david = Employee.new("David", "TA", 10000, "Darren")
ned.employees << darren
darren.employees << shawna << david

p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)
