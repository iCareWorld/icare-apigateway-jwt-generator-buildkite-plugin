# File Counter Buildkite Plugin

Generate a JWT token and save it in the variable `ICARE_APIGATEWAY_JWT`

## Example

Add the following to your `pipeline.yml`:

```yml
steps:
  - command: sync_assets
    plugins:
      - iCareWorld/icare-apigateway-jwt-generator#v1.0.4:
          service: 'screening'
          stage: 'staging-au' # optional, it would try to get the metadata "stage"
          region: 'eu-north-1' # optional, it would try to get the metadata "stage"
          expiration: 60 # optional, default to 120 (seconds)
```

## Validation
To validate the plugin run 

```bash
docker run -it --rm -v "$PWD:/plugin:ro" buildkite/plugin-linter --id iCareWorld/icare-apigateway-jwt-generator
```

## Test

```bash
docker run -it --rm -v "$PWD:/plugin:ro" buildkite/plugin-tester
```
