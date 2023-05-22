class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: :uuid, default: "'#{SecureRandom.uuid}'" do |t|
      t.string :name
      t.string :email, null: false, index: { unique: true }
      t.string :password_digest, null: false
      t.string :token
      t.timestamps
    end

    create_table :records do |t|
      t.integer :distance
      t.timestamps
      t.references :user, type: :uuid, null: false, foreign_key: true
    end

    reversible do |dir|
      dir.up do
        execute <<-SQL
          CREATE VIEW ranking AS
          SELECT u.id, u.name, SUM(r.distance) AS total_distance
          FROM users u
          INNER JOIN records r ON r.user_id = u.id
          GROUP BY u.id, u.name
          ORDER BY total_distance DESC;
        SQL
      end
    
      dir.down do
        execute <<-SQL
          DROP VIEW ranking;
        SQL
      end
    end
    #End of change method
  end
end