class AddTypesToProperties < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :types, :string
  end
end
