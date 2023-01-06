class AddNameColumnToApiKeysTable < ActiveRecord::Migration[7.0]
  def change
    add_column :api_keys, :name, :string
  end
end
