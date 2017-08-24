class AddAnythingElseToSnapApplication < ActiveRecord::Migration[5.1]
  def change
    add_column :snap_applications, :anything_else, :text
  end
end
