class CreateIncomingMessages < ActiveRecord::Migration
  def up
    create_table :incoming_messages do |t|
      t.text :message_body, :null => false
      t.timestamps
    end
  end

  def down
    drop_table :incoming_messages
  end
end