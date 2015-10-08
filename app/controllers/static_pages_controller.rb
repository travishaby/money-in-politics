class StaticPagesController < ApplicationController

  include HTTParty

  def welcome
    @state_senator_info = SenatorInfo.state_senator_data("co")
    @senator_spondered_bills = SenatorSponderedBills.senator_bill_info("COL000034")
  end

  helper_method :sentaor_bills
  def senator_bills(senator_id, session)

  end

end


class SenatorInfo
  include HTTParty
  base_uri "openstates.org/api/v1//districts"

  def self.state_senator_data(state_code)
    self.get("/#{state_code.downcase}/upper/?apikey=925b4872b5324ab3a54508782989b893")
  end
end

class SenatorSponderedBills
  include HTTParty
  base_uri "openstates.org/api/v1/bills"
  def self.senator_bill_info(senator_id)
    self.get("/?state=co&chamber=upper&sponsor_id=#{senator_id}&apikey=925b4872b5324ab3a54508782989b893")
  end

end
