Ports:
* muximux: 9050
* plexrequests: 9051
* sabnzdb: 9052
* sonarr: 9053
* radarr: 9054
* plexpy: 9055
* ha: 9056
* portainer: 9057
* unifi: 9058, 8081, 8443, 8843, 8880

# Traefik Proxy into HA

* Host network mode is issue.  This works with correct trusted proxy in HA
  config but is likely to break on a fresh install.
