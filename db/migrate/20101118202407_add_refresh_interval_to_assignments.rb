class AddRefreshIntervalToAssignments < ActiveRecord::Migration
  def self.up
    rename_column :assignments, :tokens_per_day, :tokens_allowed
    add_column :assignments, :token_refresh_period, :string
  end

  def self.down
    rename_column :assignments, :tokens_allowed, :tokens_per_day
    remove_column :assignments, :token_refresh_period
  end
end
