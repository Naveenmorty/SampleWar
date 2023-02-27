#!/bin/bash

OAUTH2_TOKEN=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

OWNER=Naveenmorty
REPO=SampleWar # retrieve this with: basename $(git config --get remote.origin.url) .git

curl https://api.github.com/repos/${OWNER}/${REPO}/branches/master \
    -H "Authorization: token $OAUTH2_TOKEN" \
    -H "Accept: application/vnd.github.loki-preview+json" \
    -X PATCH \
    -d '{
      "protection": {
        "enabled": true,
        "required_status_checks": {
          "enforcement_level": "everyone",
          "contexts": [
            "default"
          ]
        }
      },
      "lock_branch": true
    }' \
    -s | json protection
