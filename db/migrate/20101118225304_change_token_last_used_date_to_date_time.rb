class ChangeTokenLastUsedDateToDateTime < ActiveRecord::Migration
  def self.up
    change_column :tokens, :last_token_used_date, :datetime
  end

  def self.down
    change_column :tokens, :last_token_used_date, :date
  end
end
