class CreateIssues < ActiveRecord::Migration[6.0]
  def change
    create_table :issues do |t|
      t.string :name
      t.string :description
      t.string :site_detail_url
      t.string :image_url

      t.timestamps
    end
  end
end
