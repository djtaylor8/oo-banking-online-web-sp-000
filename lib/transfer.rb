require 'pry'

class Transfer
  attr_reader :sender, :receiver, :amount 
  attr_accessor :status
  
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    if @sender.valid? == true && @receiver.valid? == true
      true 
    else 
      false
    end 
  end
  
  def execute_transaction
    if @sender.balance > @amount && self.status != "complete"  
      @receiver.balance += @amount 
      @sender.balance -= @amount 
      self.status = "complete"
    else 
      return "Transaction rejected. Please check account balance."
    end
    binding.pry 
  end 
  
end
