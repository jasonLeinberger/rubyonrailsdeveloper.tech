class CreateSiteprops < ActiveRecord::Migration[5.2]
  def change
    create_table :siteprops do |t|
      t.string :title
      t.string :landingheader
      t.text :landingcontent

      t.timestamps
    end
  end
end
