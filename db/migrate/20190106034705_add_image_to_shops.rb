class AddImageToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :image, :string
  end
end
