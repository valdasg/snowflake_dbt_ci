# DBT / Snowflake CI project

This is a simple DBT/Snowflake integrated CI project to start DBT job on pull request. 
Prequisites:
- DBT account and local instalation
- Snowflake account
- Git account and local instalation

## DBT instalation
Sign up for free DBT account.
To install DBT locally run:
```
pip install \
 dbt-core \
 dbt-snowflake
```

First command installs DBT core components and second one Snowflake driver needed to be able to use Snowflake as compute engine.

Important: you can run pip on virtual environment, in this case do not forget to modify dbt_project.yaml to point to correct dbt profiles file location. 

After instalation is complete run:
```
dbt init dbt_sbow_dev
```

dbt init initialises default dbt folder structure. After it's completed navigate to folder dirrectory and modify dbt_project.yml file as needed.

## Connect to Snowflake
Create users, roles and warehouses according needs. Update profiles.yml file in ~/.dbt adding:
```
config:
  send_anonymous_usage_stats: false
dbt_sbow_dev:
  outputs:
    dev:
      account: <snowflake account>
      database: <snowflake database>
      password: <password>
      role: <role>
      schema: <schema>
      threads: 1
      type: snowflake
      user: <user>
      warehouse: <warehouse>
  target: dev
```
Test connection running:
```
dbt debug
```
## DBT Cloud setup
Create DBT job, connect it with git app and web hook to run job on pull request.

### Finally
Create git branch, create your models, tests, etc and create a pull request. DBT job will run on merging a pull request.
```
git branch test-connection
git switch test-connection
```
Make changes and commit:
```
git add .
git commit -m "test connection"
```
Push changes:
```
git push origin test-connection
```
Merge it in Github and delete a branch:
```
git branch -D test-connection
```
That's it!

