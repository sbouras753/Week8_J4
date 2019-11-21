class AddDefaultValueToEmail < ActiveRecord::Migration[5.2]
  def reversible
    change_column :emails, :read, :boolean, default: false
  end
end
