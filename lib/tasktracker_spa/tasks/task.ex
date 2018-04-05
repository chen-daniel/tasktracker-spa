defmodule TasktrackerSpa.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tasks" do
    field :completed, :boolean, default: false
    field :description, :string
    field :time, :integer
    field :title, :string
    belongs_to :created_by, TasktrackerSpa.Accounts.User
    belongs_to :assigned_to, TasktrackerSpa.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :description, :time, :completed, :created_by_id, :assigned_to_id])
    |> validate_required([:title, :description, :time, :completed, :created_by_id, :assigned_to_id])
  end
end
