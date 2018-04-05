defmodule TasktrackerSpaWeb.TaskView do
  use TasktrackerSpaWeb, :view
  alias TasktrackerSpaWeb.TaskView
  alias TasktrackerSpaWeb.UserView

  def render("index.json", %{tasks: tasks}) do
    %{data: render_many(tasks, TaskView, "task.json")}
  end

  def render("show.json", %{task: task}) do
    %{data: render_one(task, TaskView, "task.json")}
  end

  def render("task.json", %{task: task}) do
    %{id: task.id,
      title: task.title,
      description: task.description,
      time: task.time,
      completed: task.completed,
      created_by: render_one(task.created_by, UserView, "user.json"),
      assigned_to: render_one(task.assigned_to, UserView, "user.json")
    }
  end
end
