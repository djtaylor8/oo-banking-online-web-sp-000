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
    if valid? && self.status == "pending" && @sender.balance > @amount
      @receiver.balance += @amount 
      @sender.balance -= @amount
      self.status = "complete"
    else 
     reject_transaction 
    end
  end
  
  def reject_transaction
    self.status = "rejected"
    puts "Transaction rejected. Please check your account balance."
  end 
  
end
