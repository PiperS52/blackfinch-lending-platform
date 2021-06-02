require 'application'

describe Application do 
  let(:successful_application) { Application.new(1100000, 5000000, 975) }
  let(:declined_application) { Application.new(3000000, 5000000, 575) }

  describe '#is_successful?' do 
    it 'returns successful status for a successful application with loan amount' do 
      expect(successful_application.is_successful?).to include('successful')
    end 

    it 'returns declined status for an unsuccessful application with 0' do 
      expect(declined_application.is_successful?).to include('declined')
    end 
  end

  describe '#calc_ltv' do 
    it 'returns the ltv for the application regardless of status' do 
      expect(successful_application.calc_ltv).to eq(22.0)
    end 
  end 

end 

