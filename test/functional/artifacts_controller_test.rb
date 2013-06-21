require 'test_helper'

class ArtifactsControllerTest < ActionController::TestCase
  setup do
    @artifact = artifacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:artifacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create artifact" do
    assert_difference('Artifact.count') do
      post :create, artifact: { code: @artifact.code, dating: @artifact.dating, description: @artifact.description, gallery_id: @artifact.gallery_id, language: @artifact.language, material_id: @artifact.material_id, name: @artifact.name, place: @artifact.place, size: @artifact.size }
    end

    assert_redirected_to artifact_path(assigns(:artifact))
  end

  test "should show artifact" do
    get :show, id: @artifact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @artifact
    assert_response :success
  end

  test "should update artifact" do
    put :update, id: @artifact, artifact: { code: @artifact.code, dating: @artifact.dating, description: @artifact.description, gallery_id: @artifact.gallery_id, language: @artifact.language, material_id: @artifact.material_id, name: @artifact.name, place: @artifact.place, size: @artifact.size }
    assert_redirected_to artifact_path(assigns(:artifact))
  end

  test "should destroy artifact" do
    assert_difference('Artifact.count', -1) do
      delete :destroy, id: @artifact
    end

    assert_redirected_to artifacts_path
  end
end
