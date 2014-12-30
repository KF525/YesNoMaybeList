class RemoveColumnFromAnswers < ActiveRecord::Migration
  def change
    remove_column :answers, :user_id, :integer
    remove_column :answers, :list_id, :integer
  end
end
