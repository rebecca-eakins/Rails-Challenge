class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string  :header,    default: '',  null: false
      t.string  :subheader, default: '',  null: false
      t.text    :body
      t.integer :author_id, default: nil, null: false

      t.timestamps null: false
    end
  end
end
