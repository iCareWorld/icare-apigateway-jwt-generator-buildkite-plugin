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
          expiration: 30 # optional, default to 60 (seconds)
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

# Notable issues

At this moment, the only client of this plugin is `screening-service` to hit `import-map-deployer` and synk the frontend assets. 
Unfortunatelly, that service is only deployed in `AU` so, temporarelly, we have some code in the hook that dinamically changes any other region to au. 

```bash
# TODO: Remove this line to open up tp multi env. The only implementation now is import-map-deploy (only au)
if [[ "$STAGE" =~ "prod" ]]; then STAGE="prod-au"; else STAGE="staging-au"; fi
```
