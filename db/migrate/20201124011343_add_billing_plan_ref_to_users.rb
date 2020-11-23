class AddBillingPlanRefToUsers < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :global_max_participants
    remove_column :users, :global_duration
    add_reference :users, :billing_plan, foreign_key: true

    ActiveRecord::Base.connection.execute("UPDATE users SET billing_plan_id = 1")
  end

  def down
    add_column :users, :global_max_participants, :integer, default: 10
    add_column :users, :global_duration, :integer, default: 60
    remove_reference :users, :billing_plan, foreign_key: true
  end
end
