class TaskChannel < ActionCable::Channel::Base
  def subscribed
    stream_from "task_notify_#{params[:task_id]}"
  end

  def unsubscribed
    stop_all_streams
  end

  def receive data
    ActionCable.server.broadcast(
      "task_notify_#{params[:task_id]}",
      { user: current_user.as_json, task: Task.find(params[:task_id]).as_json }
    )
  end
end
