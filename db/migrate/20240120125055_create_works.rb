class CreateWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :works do |t|
      t.references :user
      t.string :genre
      t.string :history
      t.string :publisher
      t.date :publishdate
      t.string :link_url
      t.string :sns_url
      t.string :career
      t.integer :age
      t.string :assistant_history
      t.string :drawing_form
      t.string :profile
      t.boolean :working_style

      t.timestamps
    end
  end
end
