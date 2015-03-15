class AddHashStringToBranches < ActiveRecord::Migration
  def change
    add_column :branches, :hash_string, :string
  end
end
