class CreateBillingPlans < ActiveRecord::Migration[5.2]
  def up 
    create_table :billing_plans do |t|
      t.integer :global_max_participants, null: false
      t.integer :global_max_duration
      t.float :price, null: false
      t.string :name, null: false
      t.boolean :hidden, default: false
      t.boolean :unlimited_duration, default: false

      t.timestamps
    end

    ActiveRecord::Base.connection.execute("INSERT INTO billing_plans (global_max_participants, global_max_duration, price, name, created_at, updated_at)" \
      " VALUES (10, 60, 0.0, 'default', NOW(), NOW())")
  end

  def down 
    drop_table :billing_plans
  end
end
