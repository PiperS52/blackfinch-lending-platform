# writing and reporting of loans

# output => 
#1. application successful/declined 
#2. total number of applicants to date
#3. total value of loans written to date
#4. mean LTV of all applications
require_relative 'application'

class Reporter 
  
  def initialize 
    @applications = []
    @written_loans = []
    @total_ltvs = []
  end

  def total_num_applications
    #returns all loan apps made showing success/decline status
    successful_count = @applications.count("successful")
    declined_count = @applications.count("declined")
    puts "Total applications: #{successful_count} successful, #{declined_count} declined"
  end 

  def total_value_loans
    #returns total value of all loans written
    puts "Total value of loans written: #{@written_loans.sum}"
  end 

  def avg_ltv_applications
    #returns mean ltv of all apps
    mean = (@total_ltvs.sum().to_f / @total_ltvs.length()).round(1)
    puts "The mean average LTV of all applications to date is #{mean}"
  end 

  def add_application(application = Application.new)
    #adds assessment of a newly written application
    ltv = application.calc_ltv
    @total_ltvs.push(ltv)

    decision = application.is_successful?
    @applications.push(decision[0])
    @written_loans.push(decision[1])
  end 

end 