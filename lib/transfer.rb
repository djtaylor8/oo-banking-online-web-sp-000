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
    if !@sender.valid? == true && @status != "complete"  
      @receiver.balance += @amount 
      @sender.balance -= @amount
      @status = "complete"
    else  
      puts "Transaction rejected. Please check your account balance."
      @status = "rejected"
    end
  end 
  
end
