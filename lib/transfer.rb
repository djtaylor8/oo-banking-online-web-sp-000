require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?(sender, receiver)
    if sender.valid? == true && receiver.valid? == true
      true 
    else 
      false
    end
    binding.pry 
  end
  
end
