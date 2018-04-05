defmodule TasktrackerSpaWeb.TaskController do
  use TasktrackerSpaWeb, :controller

  alias TasktrackerSpa.Tasks
  alias TasktrackerSpa.Tasks.Task

  action_fallback TasktrackerSpaWeb.FallbackController

  def index(conn, _params) do
    tasks = Tasks.list_tasks()
    render(conn, "index.json", tasks: tasks)
  end

  def create(conn, %{"task" => task_params}) do
    {:ok, user_id} = Phoenix.Token.verify(conn, "auth token", task_params["token"], max_age: 86400)
    if task_params["assigned_to_id"] == "" do
      task_params = %{task_params | "assigned_to_id" => task_params["user_id"] }
    end
    task_params = %{task_params | "created_by_id" => task_params["user_id"]}
    if task_params["user_id"] != user_id do
      IO.inspect({:bad_match, task_params["user_id"], user_id})
      raise "User Mismatch"
    end

    with {:ok, %Task{} = task} <- Tasks.create_task(task_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", task_path(conn, :show, task))
      |> render("show.json", task: task)
    end
  end

  def show(conn, %{"id" => id}) do
    task = Tasks.get_task!(id)
    render(conn, "show.json", task: task)
  end

  def update(conn, %{"id" => id, "task" => task_params}) do
    task = Tasks.get_task!(id)

    with {:ok, %Task{} = task} <- Tasks.update_task(task, task_params) do
      render(conn, "show.json", task: task)
    end
  end

  def delete(conn, %{"id" => id}) do
    task = Tasks.get_task!(id)
    with {:ok, %Task{}} <- Tasks.delete_task(task) do
      send_resp(conn, :no_content, "")
    end
  end
end
