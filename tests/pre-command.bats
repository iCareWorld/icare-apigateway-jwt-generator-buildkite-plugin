#!/usr/bin/env bats

load "$BATS_PLUGIN_PATH/load.bash"

@test "With required parameter, it generate the jwt" {
  export BUILDKITE_PLUGIN_ICARE_APIGATEWAY_JWT_GENERATOR_SERVICE="test"

  stub buildkite-agent 'meta-data get "stage" : echo staging-eu'
  stub aws 'kms sign \* \* \* \* \* \* \* \* \* \* : echo "{ \"Signature\":\"signature\" }"'

  run "$PWD/hooks/pre-command"

  assert_success

  unstub buildkite-agent
  unstub aws
}
