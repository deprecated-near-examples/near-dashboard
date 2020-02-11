# chain id
curl -s https://rpc.nearprotocol.com/status | jq '.chain_id'
curl -s https://rpc.nearprotocol.com/status | jq '.version | "\(.build) \(.version)"'
curl -s https://rpc.nearprotocol.com/status | jq '.sync_info'

# validators
curl -s https://rpc.nearprotocol.com/status | jq  --raw-output '.validators[] | "\(.account_id) \(.is_slashed)"' | awk -F ' ' 'BEGIN {printf(" [ %-40s ] [ %-10s ]\n" ,"Account", "Slashed?")} {printf("   %-40s     %-10s\n", $1, $2)}'
curl -s https://rpc.nearprotocol.com/metrics | grep '^validator_active_total' | awk -F ' ' '{print $2}'
curl -s https://rpc.nearprotocol.com/metrics | grep '^validators_amount_staked'

# blocks
curl -s https://rpc.nearprotocol.com/metrics | grep '^block_produced_total' | awk -F ' ' '{ printf(" %d", $2) }'
curl -s https://rpc.nearprotocol.com/metrics | grep '^block_height_head' | awk -F ' ' '{ printf(" %d", $2) }'
curl -s https://rpc.nearprotocol.com/metrics | grep '^peer_connections_total' | awk -F ' ' '{ printf(" %d", $2) }'
curl -s https://rpc.nearprotocol.com/metrics | grep '^transaction_processed_successefully_total' | awk -F ' ' '{ printf(" %d", $2) }'
curl -s https://rpc.nearprotocol.com/metrics | grep '^transaction_processed_total' | awk -F ' ' '{ printf(" %d", $2) }'

# actions
curl -s https://rpc.nearprotocol.com/metrics | grep '^action_add_key_total' | awk -F ' ' '{ printf(" %d", $2) }'
curl -s https://rpc.nearprotocol.com/metrics | grep '^action_create_account_total' | awk -F ' ' '{ printf(" %d", $2) }'
curl -s https://rpc.nearprotocol.com/metrics | grep '^action_deploy_contract_total' | awk -F ' ' '{ printf(" %d", $2) }'
curl -s https://rpc.nearprotocol.com/metrics | grep '^action_function_call_total' | awk -F ' ' '{ printf(" %d", $2) }'
curl -s https://rpc.nearprotocol.com/metrics | grep '^action_stake_total'  | awk -F ' ' '{ printf(" %d", $2) }'
curl -s https://rpc.nearprotocol.com/metrics | grep '^action_transfer_total' | awk -F ' ' '{ printf(" %d", $2) }'

# communications
curl -s https://rpc.nearprotocol.com/metrics | grep '^http_rpc_requests_total' | awk -F ' ' '{ printf(" %d", $2) }'
curl -s https://rpc.nearprotocol.com/metrics | grep '^http_status_requests_total' | awk -F ' ' '{ printf(" %d", $2) }'

# block processing
curl -s https://rpc.nearprotocol.com/metrics | grep '^block_processing_time_bucket{le="0.005"}' | awk -F ' ' '{ printf(" %d", $2) }'
curl -s https://rpc.nearprotocol.com/metrics | grep '^block_processing_time_bucket{le="0.01"}' | awk -F ' ' '{ printf(" %d", $2) }'
curl -s https://rpc.nearprotocol.com/metrics | grep '^block_processing_time_bucket{le="0.025"}' | awk -F ' ' '{ printf(" %d", $2) }'
curl -s https://rpc.nearprotocol.com/metrics | grep '^block_processing_time_bucket{le="0.05"}' | awk -F ' ' '{ printf(" %d", $2) }'
curl -s https://rpc.nearprotocol.com/metrics | grep '^block_processing_time_bucket{le="0.1"}' | awk -F ' ' '{ printf(" %d", $2) }'
curl -s https://rpc.nearprotocol.com/metrics | grep '^block_processing_time_bucket{le="0.25"}' | awk -F ' ' '{ printf(" %d", $2) }'
curl -s https://rpc.nearprotocol.com/metrics | grep '^block_processing_time_bucket{le="0.5"}' | awk -F ' ' '{ printf(" %d", $2) }'
curl -s https://rpc.nearprotocol.com/metrics | grep '^block_processing_time_bucket{le="1"}' | awk -F ' ' '{ printf(" %d", $2) }'
curl -s https://rpc.nearprotocol.com/metrics | grep '^block_processing_time_bucket{le="2.5"}' | awk -F ' ' '{ printf(" %d", $2) }'
