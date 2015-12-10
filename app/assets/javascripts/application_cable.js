App = {};
App.cable = Cable.createConsumer("ws://" + window.location.host + "/websocket");

App.init = function () {
  Notification.requestPermission();
  App.cable.task_id = $("[data-task-id]").data("task-id") || null;

  App.cable.taskChannel && delete App.cable.taskChannel;
  if (App.cable.task_id) {
    App.cable.taskChannel = App.cable.subscriptions.create(
      {
        channel: "TaskChannel",
        task_id: App.cable.task_id,
      }, {
      received: function(data) {
        new Notification(data.user.email);
        Turbolinks.visit(window.location);
      }
    });
  }
};

$(document).on("ready"      , App.init);
$(document).on("page:change", App.init);
