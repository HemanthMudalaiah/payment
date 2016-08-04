require 'test_helper'

class PaymentTxnsControllerTest < ActionController::TestCase
  setup do
    @payment_txn = payment_txns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payment_txns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payment_txn" do
    assert_difference('PaymentTxn.count') do
      post :create, payment_txn: {  }
    end

    assert_redirected_to payment_txn_path(assigns(:payment_txn))
  end

  test "should show payment_txn" do
    get :show, id: @payment_txn
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @payment_txn
    assert_response :success
  end

  test "should update payment_txn" do
    patch :update, id: @payment_txn, payment_txn: {  }
    assert_redirected_to payment_txn_path(assigns(:payment_txn))
  end

  test "should destroy payment_txn" do
    assert_difference('PaymentTxn.count', -1) do
      delete :destroy, id: @payment_txn
    end

    assert_redirected_to payment_txns_path
  end
end
