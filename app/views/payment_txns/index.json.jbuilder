json.array!(@payment_txns) do |payment_txn|
  json.extract! payment_txn, :id
  json.url payment_txn_url(payment_txn, format: :json)
end
