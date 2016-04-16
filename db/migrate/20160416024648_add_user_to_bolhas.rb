class AddUserToBolhas < ActiveRecord::Migration
  def change
    add_reference :bolhas, :user, index: true, foreign_key: true
  end
end
