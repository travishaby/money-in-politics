class StaticPagesController < ApplicationController

  def welcome
    @state_senator_info = SenatorInfo.state_senator_data("co")
  end

  helper_method :senator_bills_2015
  def senator_bills_2015(senator_id)
    SenatorSponderedBills.senator_bill_info(senator_id)
  end

end


class SenatorInfo
  include HTTParty
  base_uri "openstates.org/api/v1//districts"

  def self.state_senator_data(state_code)
    self.get("/#{state_code.downcase}/upper/?apikey=#{ENV['SUNLIGHT_API_KEY']}")
  end
end

class SenatorSponderedBills
  include HTTParty
  base_uri "openstates.org/api/v1/bills"
  def self.senator_bill_info(senator_id)
    self.get("/?state=co&chamber=upper&sponsor_id=#{senator_id}&search_window=session%3A2015A&apikey=#{ENV['SUNLIGHT_API_KEY']}")
  end
end


# <% @senator_spondered_bills.each do |bill| %>
#   <div class="row">
#     <div class="div-col-3">
#       <%= bill["title"] %>: <%= bill["bill_id"] %>
#     </div>
#   </div>
# <% end %>
