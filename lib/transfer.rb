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
    if @amount > @sender.balance 
      puts "Transaction rejected. Please check your account balance"
      @status = "rejected"
    else 
      @receiver.balance
      @sender.balance
      @status = "complete"
    end
  end 
  
end
