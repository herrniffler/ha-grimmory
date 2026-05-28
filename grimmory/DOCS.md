# Grimmory

Self-hosted book & comic library — EPUB, PDF, CBZ, MOBI, M4B and more.

## Prerequisites

The **MariaDB** add-on must be installed and running before starting Grimmory.

### MariaDB setup

In the MariaDB add-on configuration, add:

```yaml
databases:
  - grimmory
logins:
  - username: grimmory
    password: grimmory_secret
rights:
  - username: grimmory
    database: grimmory
```

Replace `grimmory_secret` with a secure password and update the Grimmory configuration to match.

## File locations

| Purpose | Path in HA |
|---------|-----------|
| Books | `/media/grimmory/books` |
| Bookdrop (auto-import) | `/share/grimmory/bookdrop` |

## First start

After starting the add-on, open the Web UI. On first launch you will be guided through creating an admin account and your first library.

Point the library at `/media/grimmory/books`.
