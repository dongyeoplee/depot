class PaymentType < ActiveRecord::Base
  attr_accessible :name
  
  def self.names
    all.collect do |payment_type|
      payment_type.name
    end
  end
end
