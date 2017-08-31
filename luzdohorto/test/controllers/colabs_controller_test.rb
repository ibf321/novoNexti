require 'test_helper'

class ColabsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @colab = colabs(:one)
  end

  test "should get index" do
    get colabs_url
    assert_response :success
  end

  test "should get new" do
    get new_colab_url
    assert_response :success
  end

  test "should create colab" do
    assert_difference('Colab.count') do
      post colabs_url, params: { colab: { cadastro_id: @colab.cadastro_id, colaborador_id: @colab.colaborador_id } }
    end

    assert_redirected_to colab_url(Colab.last)
  end

  test "should show colab" do
    get colab_url(@colab)
    assert_response :success
  end

  test "should get edit" do
    get edit_colab_url(@colab)
    assert_response :success
  end

  test "should update colab" do
    patch colab_url(@colab), params: { colab: { cadastro_id: @colab.cadastro_id, colaborador_id: @colab.colaborador_id } }
    assert_redirected_to colab_url(@colab)
  end

  test "should destroy colab" do
    assert_difference('Colab.count', -1) do
      delete colab_url(@colab)
    end

    assert_redirected_to colabs_url
  end
end
