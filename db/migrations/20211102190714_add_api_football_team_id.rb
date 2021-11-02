Hanami::Model.migration do
  change do
    alter_table :teams do
      add_column :api_team_id, Integer, null: false
    end
  end
end
