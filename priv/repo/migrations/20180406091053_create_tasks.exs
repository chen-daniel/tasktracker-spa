defmodule TasktrackerSpa.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :title, :string, null: false
      add :description, :text, null: false
      add :time, :integer, null: false
      add :completed, :boolean, default: false, null: false
      add :created_by_id, references(:users, on_delete: :delete_all)
      add :assigned_to_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create index(:tasks, [:created_by_id])
    create index(:tasks, [:assigned_to_id])
  end
end
