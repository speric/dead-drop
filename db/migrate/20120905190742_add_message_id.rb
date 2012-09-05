class AddMessageId < ActiveRecord::Migration
  def up
  	add_column :incoming_messages, :message_id, :string, :null => true
  end

  def down
  	remove_column :incoming_messages, :message_id
  end
end
