class CreateQuizzes < ActiveRecord::Migration[6.1]
  def change
    create_table :quizzes, id: :bigint, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
      t.string :name
      t.integer :pass_threshold
      t.timestamps
    end

    add_reference :quizzes, :user, type: :bigint, foreign_key: { name: "quizzes2user" }, index: { name: "quizzes2user" }, after: :id
  end
end
