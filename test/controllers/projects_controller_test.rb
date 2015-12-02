require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post :create, params: { project: { ends_at: @project.ends_at, name: @project.name } }
    end

    assert_redirected_to project_path(Project.last)
  end

  test "should show project" do
    get :show, params: { id: @project }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { id: @project }
    assert_response :success
  end

  test "should update project" do
    patch :update, params: { id: @project, project: { ends_at: @project.ends_at, name: @project.name } }
    assert_redirected_to project_path(@project)
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete :destroy, params: { id: @project }
    end

    assert_redirected_to projects_path
  end
end
