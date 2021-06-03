#creation of a new application

class Application 

  def initialize(loan_amount, asset_value, credit_score)
    @loan_amount = loan_amount
    @asset_value = asset_value 
    @credit_score = credit_score
    @ltv = 0
    @result = []
  end 

  def is_successful?
    #determines whether application successful or not
    calc_ltv
    loan_amount_too_high_or_too_low?
    successful_loan_over_1m?
    successful_loan_less_1m?
    return @result 
  end

  def calc_ltv
    #creates new application, giving it the appropriate stataus
    @ltv = ((@loan_amount.to_f/@asset_value)*100).round(0)
    return @ltv
  end

  private 

  def loan_amount_too_high_or_too_low?
    if @loan_amount > 1500000 || @loan_amount < 100000
      @result.push("declined", 0)
    end
  end

  def successful_loan_over_1m?
    if (@loan_amount >= 1000000) && (@ltv <= 60) && (@credit_score >= 950)
      @result.push("successful", @loan_amount)
    end
  end 

  def successful_loan_less_1m?
    if @loan_amount < 1000000 && @loan_amount >= 100000
      if (@ltv < 60 && @credit_score >= 750) || (@ltv < 80 && @credit_score >= 800) || (@ltv < 90 && @credit_score >= 900)
        @result.push("successful", @loan_amount)
      else  
        @result.push("declined", 0)
      end 
    end
  end
end 
 