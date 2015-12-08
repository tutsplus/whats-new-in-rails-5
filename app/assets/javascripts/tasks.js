$(function() {
  $(".task-done").on("change", function() {
    var _this = $(this);
    $.post("/tasks/" + $(this).data("id"), { "task": { "done": _this.prop("checked") }, "_method": "patch" }, function() {
      _this.parent().effect("highlight");
    }, "script");
  });
});
