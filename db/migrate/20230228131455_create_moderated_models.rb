class CreateModeratedModels < ActiveRecord::Migration[7.0]
  def change
    create_table :moderated_models do |t|
      t.string :title
      t.text :content
      t.boolean :is_accepted
      t.timestamps
    end
  end
end
