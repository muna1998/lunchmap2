class RemoveContentFromShops < ActiveRecord::Migration[5.2]
  def change
    remove_column :shops, :content, :string
  end
end
