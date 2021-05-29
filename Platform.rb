# writing and reporting of loans
# assumptions

# output => 
#1. application successful/declined 
#2. total number of applicants to date
#3. total value of loans written to date
#4. mean LTV of all applications

class Platform 
  
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

  def make_application(loan_amount, asset_value, credit_score)
    #creates new application, giving it the appropriate stataus
    ltv = ((loan_amount.to_f/asset_value)*100).round(0)
    @total_ltvs.push(ltv)
    if loan_amount > 1500000 || loan_amount < 100000
      @applications.push("declined")
    elsif (loan_amount >= 1000000) && (ltv <= 60) && (credit_score >= 950)
      @applications.push("successful")
      @written_loans.push(loan_amount)
    elsif loan_amount < 1000000
      if (ltv < 60 && credit_score >= 750) || (ltv < 80 && credit_score >= 800) || (ltv < 90 && credit_score >= 900)
        @applications.push("successful")
        @written_loans.push(loan_amount)
      else  
        @applications.push("declined")
      end  
    else
      @applications.push("declined")
    end 
  end 

end 

# future - extract out an Application class (with create/write method), and modify 
# Platform to ie. Reporting class
# testing