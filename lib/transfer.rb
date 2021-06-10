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
    if @sender.valid? == true && @status != "complete"
      self.status = "complete"
      @receiver.balance += @amount 
      @sender.balance -= @amount
    elsif @sender.status == "closed" || @receiver.status == "closed"
      puts "Transaction rejected. Please check your account balance."
      @
    end
  end 
  
end
