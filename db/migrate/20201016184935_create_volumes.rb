class CreateVolumes < ActiveRecord::Migration[6.0]
  def change
    create_table :volumes do |t|
      t.string :name
      t.string :description
      t.integer :start_year
      t.string :site_detail_url
      t.string :image_url

      t.timestamps
    end
  end
end
