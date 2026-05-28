# Grimmory Home Assistant Add-on

Self-hosted book & comic library manager running inside Home Assistant OS.

Supports: **EPUB, PDF, MOBI, AZW3, FB2, CBZ/CBR, M4B, M4A, MP3**

## Voraussetzungen

1. Das **MariaDB** Add-on muss installiert und gestartet sein.
2. In der MariaDB-Konfiguration muss eine Datenbank für Grimmory angelegt werden.

### MariaDB einrichten

Im MariaDB Add-on unter "Konfiguration" folgendes hinzufügen:

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

## Installation

1. Dieses Repository in Home Assistant hinzufügen:
   **Einstellungen → Add-ons → Add-on Store → ⋮ → Repositories**
   ```
   https://github.com/DEIN_USERNAME/ha-grimmory
   ```

2. **Grimmory** im Add-on Store suchen und installieren.

3. Konfiguration anpassen (Passwort etc.) und Add-on starten.

4. Web UI öffnen unter: `http://<HA-IP>:6060`

## Konfiguration

| Option | Standard | Beschreibung |
|--------|---------|--------------|
| `db_host` | `core-mariadb` | MariaDB Host (Standard HA Add-on Name) |
| `db_port` | `3306` | MariaDB Port |
| `db_name` | `grimmory` | Datenbankname |
| `db_user` | `grimmory` | Datenbankbenutzer |
| `db_password` | `grimmory_secret` | Datenbankpasswort (bitte ändern!) |
| `timezone` | `Europe/Berlin` | Zeitzone |

## Dateipfade

- **Bücher:** `/media/grimmory/books` → In HA: Netzwerkspeicher unter `media`
- **App-Daten:** `/share/grimmory/data`
- **Bookdrop:** `/share/grimmory/bookdrop` (Bücher hier ablegen → werden automatisch importiert)

## GitHub Repository

https://github.com/grimmory-tools/grimmory