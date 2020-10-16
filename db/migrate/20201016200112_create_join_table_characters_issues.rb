class CreateJoinTableCharactersIssues < ActiveRecord::Migration[6.0]
  def change
    create_join_table :characters, :issues do |t|
      # t.index [:character_id, :issue_id]
      # t.index [:issue_id, :character_id]
    end
  end
end
