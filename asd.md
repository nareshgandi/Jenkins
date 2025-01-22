[[cloud-sql-for-postgresql]]
==== Cloud SQL for PostgreSQL

{prodname} can be used with link:https://cloud.google.com/sql/postgresql/[Cloud SQL for PostgreSQL]. Cloud SQL for PostgreSQL supports the `pgoutput` logical decoding plugin, which is required for {prodname}.

Enable `cloudsql.logical_decoding` flag: In Cloud SQL, you can enable logical decoding by setting the `cloudsql.logical_decoding` flag to `on`. To change this flag, you can use the Cloud SQL Console or the `gcloud` command-line tool. 

Detailed instructions for enabling or disabling flags in Cloud SQL are available in the link:https://cloud.google.com/sql/docs/postgres/flags/[official documentation]. 

Once the flag is set, it automatically adjusts the `wal_level` configuration parameter to `logical`. You can verify this setting by running the following query:

```
SHOW wal_level;
```

**Create a replication user**: To use logical decoding features, you create a PostgreSQL user with the `REPLICATION` attribute or grant replication attribute to existing user.

Run the following command with `postgres` user or a member of `cloudsqlsuperuser` user

```
CREATE USER replication_user WITH REPLICATION IN ROLE cloudsqlsuperuser LOGIN PASSWORD 'secret';
```

Alternatively, you can set this attribute on an existing user:

```
ALTER USER existing_user WITH REPLICATION;
```

**Set the Debezium plugin.name Parameter**: Use `pgoutput` as the plugin name in the Debezium connector configuration. For example:

```
{
      ..
      "plugin.name": "pgoutput",
      ..
      ..
}
```
