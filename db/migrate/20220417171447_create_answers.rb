class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers, id: :bigint, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
      t.string :alt_1
      t.string :alt_2
      t.string :alt_3
      t.string :alt_4
      t.string :alt_5
      t.timestamps
    end

    add_reference :answers, :user, type: :bigint, foreign_key: { name: "answers2user" }, index: { name: "answers2user" }, after: :id
    add_reference :answers, :attempt, type: :bigint, foreign_key: { name: "answers2attempt" }, index: { name: "answers2attempt" }, after: :user_id
    add_reference :answers, :question, type: :bigint, foreign_key: { name: "answers2question" }, index: { name: "answers2question" }, after: :attempt_id
  end
end
