class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.text :body
      t.integer :post_id
      t.timestamps
    end
  end
end
