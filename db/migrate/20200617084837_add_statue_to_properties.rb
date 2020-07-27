class AddStatueToProperties < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :statue, :string, default: "available"
  end
end
