class AddVolumeToIssues < ActiveRecord::Migration[6.0]
  def change
    add_reference :issues, :volume, null: false, foreign_key: true
  end
end
