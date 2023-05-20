# Import Superset Dashboard Action

This action imports a dashboard from local path ZIP file to Superset
This action expects to have 3 additional environment variables inside the workflow

1. `SUPERSET_USERNAME` - Your username for Superset
2. `SUPERSET_PASSWORD` - Your password for Superset
3. `DBS_PASSWORDS` - JSON map of passwords for each featured DB in the dashboard. For example, if the dashboard includes a database config for MyDatabase, the password should be provided in the following format: {"MyDatabase": "my_password"}. If no DB required, the default will be {}

## Inputs
### `url_base`
**Required** Base URL for your Superset API endpoint. Default: `http://localhost:8088`

### `dashboard_file_path`
**Required** Path of the dashboard you want to import.

### `overwrite`
**Not Required** Boolean index if to allow overwriting an existing dashboard or not. Default: `true`

## Example usage
```
uses: actions/import-superset-dashboard-action@v1
with:
  url-base: http://localhost:8088
  dashboard_file_path: dashboard.zip
  overwrite: true
```

## Example Workflow
```
name: Example Workflow for importing Superset dashboard

on:
  push:
    branches:
      - master

env:
  SUPERSET_USERNAME: test
  SUPERSET_PASSWORD: testpass
  DBS_PASSWORDS: {"MyDatabase": "my_password"}

jobs:
  uses: actions/import-superset-dashboard-action@v1
  with:
    url_base: http://localhost:8088
    dashboard_file_path: dashboard.zip
    overwrite: true
```