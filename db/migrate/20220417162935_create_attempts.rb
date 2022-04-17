class CreateAttempts < ActiveRecord::Migration[6.1]
  def change
    create_table :attempts, id: :bigint, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
      t.datetime :time_started
      t.datetime :time_ended
      t.integer :score, null: false, default: 0
      t.string :result, limit: 1, default: 'N'
      t.timestamps
    end

    add_reference :attempts, :user, type: :bigint, foreign_key: { name: "attempts2user" }, index: { name: "attempts2user" }, after: :id
    add_reference :attempts, :quiz, type: :bigint, foreign_key: { name: "attempts2quiz" }, index: { name: "attempts2quiz" }, after: :user_id
  end
end
