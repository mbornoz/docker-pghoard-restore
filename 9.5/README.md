PGHoard Restoration Docker image
================================

This image will restore a PGHoard backed up site to a local PostgreSQL server.
Just run it with the same parameters as the camptocamp/pghoard image plus the
`PGHOARD_RESTORE_SITE` parameter.

Usage:
------

```shell
$ docker run -d \
  -e 
  camptocamp/pghoard-restore
```

Environment variables:
----------------------

## PGHOARD_RESTORE_SITE

Site to restore locally from storage.

## PGHOARD_STORAGE_TYPE

Can be either `local`, `s3` or `swift`.

## PGHOARD_DIRECTORY

Directory for the path to the backup target (local) storage directory.

## PGHOARD_LOG_LEVEL

Determines log level of pghoard. (default `INFO`)

## AWS_ACCESS_KEY_ID

## AWS_SECRET_ACCESS_KEY

## AWS_BUCKETNAME

## AWS_DEFAULT_REGION

## OS_USERNAME

## OS_PASSWORD

## OS_AUTH_URL

## OS_CONTAINER_NAME

## OS_REGION_NAME

## OS_TENANT_NAME
