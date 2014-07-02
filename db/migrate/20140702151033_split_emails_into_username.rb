class SplitEmailsIntoUsername < ActiveRecord::Migration

  class User < ActiveRecord::Base
  end

  def up
    User.all.each do |user|
      split_user_name = user.email.split("@").at(0)
      user.name = split_user_name
      user.save
    end

    remove_column :users, :email

    change_column_null :users, :name, false
  end
end
