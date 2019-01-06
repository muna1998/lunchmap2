class AddContentToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :content, :text
  end
end
