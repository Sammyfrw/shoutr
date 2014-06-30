class CreateShout < ActiveRecord::Migration
  def change
    create_table :shouts do |t|
      t.text :body, null: false
      t.belongs_to :user, null: false, index: true

      t.timestamps
    end

  end
end
