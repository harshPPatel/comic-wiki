class CreateCharactersIssuesJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :characters, :issues
  end
end
