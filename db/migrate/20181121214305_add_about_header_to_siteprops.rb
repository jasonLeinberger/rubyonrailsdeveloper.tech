class AddAboutHeaderToSiteprops < ActiveRecord::Migration[5.2]
  def change
    add_column :siteprops, :about_header, :string
    add_column :siteprops, :about_content, :text
  end
end
