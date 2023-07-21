# File Counter Buildkite Plugin

Generate a JWT token and save it in the variable `ICARE_APIGATEWAY_JWT`

## Example

Add the following to your `pipeline.yml`:

```yml
steps:
  - command: sync_assets
    plugins:
      - iCareWorld/icare-apigateway-jwt-generator#v1.0.0:
          service: 'screening'
          expiration: 120
```

## Validation
To validate the plugin run 

```bash
docker run -it --rm -v "$PWD:/plugin:ro" buildkite/plugin-linter --id iCareWorld/icare-apigateway-jwt-generator
```
