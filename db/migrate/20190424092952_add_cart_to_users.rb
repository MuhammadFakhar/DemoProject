class AddCartToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :cart, :json
  end
end
