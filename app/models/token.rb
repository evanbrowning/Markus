class Token < ActiveRecord::Base

  belongs_to :grouping

  validates_presence_of :grouping_id, :tokens
  validates_numericality_of :tokens, :only_integer => true,  :greater_than_or_equal_to => 0

  def validate()
    if self.last_token_used_date
      if Time.zone.parse(self.last_token_used_date.to_s).nil?
        errors.add :last_token_used_date, 'is not a valid date'
      end
    end
  end

  # Each test will decrease the number of tokens
  # by one
  def decrease_tokens()
    if self.tokens > 0
      self.tokens = self.tokens - 1
      self.last_token_used_date = Time.now
    end
    self.save
  end

  #Reassign tokens if it is a new day or a new hour and the instructor has requested it
  def reassign_tokens_if_necessary()
    assignment = self.grouping.assignment
    if self.last_token_used_date:
      if (assignment.token_refresh_period == 'hourly' and (Time.now - self.last_token_used_date) >= 1.hour) or (assignment.token_refresh_period == 'daily' and (Time.now - self.last_token_used_date) >= 1.day)
        self.reassign_tokens()
      end
    end
  end

  # Re-assign to the student the nomber of tokens 
  # allowed for this assignment
  def reassign_tokens()
    assignment = self.grouping.assignment
    if assignment.tokens_allowed.nil?
      self.tokens = 0
    else
      self.tokens = assignment.tokens_allowed
    end
    self.save
  end

  # Update the number of tokens based on the old and new token limits
  def update_tokens(old_limit, new_limit)
    difference = new_limit - old_limit
    self.tokens = [self.tokens + difference, 0].max
    self.save
  end

end
