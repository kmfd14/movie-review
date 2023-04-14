class AddAddressToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :region, :string, default: "", null: false
    add_column :users, :province, :string, default: "", null: false
    add_column :users, :city, :string, default: "", null: false
    add_column :users, :barangay, :string, default: "", null: false
  end
end
