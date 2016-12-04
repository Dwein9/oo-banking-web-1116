class Transfer
  # your code here


  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    # @@count = 0
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end


  def execute_transaction
    # if @@count < 1
    if valid?
      if @sender.balance >= @amount && self.status != "complete"
        @sender.balance -= @amount
        @receiver.deposit(@amount)
        @status = "complete"
        # @@count += 1
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end
  end

    def reverse_transfer
      # if @@count == 1
      if self.status == "complete"
        @sender.deposit(@amount)
        @receiver.balance -= @amount
        @status = "reversed"
      end
    end
end
