class CreateProjectsTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :projects_topics do |t|
      t.references :topic, null: false
      t.references :project, null: false
    end
  end
end
