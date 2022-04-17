class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers, id: :bigint, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
      t.boolean :alt_1, null: false, default: false
      t.boolean :alt_2, null: false, default: false
      t.boolean :alt_3, null: false, default: false
      t.boolean :alt_4, null: false, default: false
      t.boolean :alt_5, null: false, default: false
      t.timestamps
    end

    add_reference :answers, :user, type: :bigint, foreign_key: { name: "answers2user" }, index: { name: "answers2user" }, after: :id
    add_reference :answers, :attempt, type: :bigint, foreign_key: { name: "answers2attempt" }, index: { name: "answers2attempt" }, after: :user_id
    add_reference :answers, :question, type: :bigint, foreign_key: { name: "answers2question" }, index: { name: "answers2question" }, after: :attempt_id
  end
end
