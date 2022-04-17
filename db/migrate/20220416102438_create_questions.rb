class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions, id: :bigint, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
      t.string :question_text
      t.string :alt_1
      t.boolean :check_1
      t.string :alt_2
      t.boolean :check_2
      t.string :alt_3
      t.boolean :check_3
      t.string :alt_4
      t.boolean :check_4
      t.string :alt_5
      t.boolean :check_5
      t.integer :points
      t.integer :sort_order
      t.timestamps
    end

    add_reference :questions, :user, type: :bigint, foreign_key: { name: "questions2user" }, index: { name: "questions2user" }, after: :id
    add_reference :questions, :quiz, type: :bigint, foreign_key: { name: "questions2quiz" }, index: { name: "questions2quiz" }, after: :user_id
  end
end
