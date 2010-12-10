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

  #Returns whether or not tokens should be reasigned based on the 
  #assignment refresh period.
  def should_reassign_tokens?()
    assignment = self.grouping.assignment
    if self.last_token_used_date:
      if (assignment.token_refresh_period == Assignment::TOKEN_REFRESH_PERIOD[:hourly] and (Time.now - self.last_token_used_date) >= 1.hour) or (assignment.token_refresh_period == Assignment::TOKEN_REFRESH_PERIOD[:daily] and (Time.now - self.last_token_used_date) >= 1.day)
        return true
      end
    end
    return false
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
