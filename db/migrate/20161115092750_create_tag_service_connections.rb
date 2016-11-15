class CreateTagServiceConnections < ActiveRecord::Migration[5.0]
  def change
    create_table :tag_service_connections do |t|
	  t.references :tag, foreign_key: true
      t.references :service, foreign_key: true
      t.timestamps
    end
  end
end
