class CreateTweets < ActiveRecord::Migration[5.1]
    def change 
        create_table :tweets do |t|
            t.string :username
            t.integer :user_id
          end
        end 

end