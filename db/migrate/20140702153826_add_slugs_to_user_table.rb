class AddSlugsToUserTable < ActiveRecord::Migration
  class User < ActiveRecord::Base
  end

  def change
     add_column :users, :slug, :string
  end
end
