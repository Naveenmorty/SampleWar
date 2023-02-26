#!/bin/bash

OAUTH2_TOKEN=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

OWNER=Naveenmorty
REPO=SampleWar # retrieve this with: basename $(git config --get remote.origin.url) .git

curl https://api.github.com/repos/${OWNER}/${REPO}/branches/master \
    -H "Authorization: token $OAUTH2_TOKEN" \
    -H "Accept: application/vnd.github+json" \
    -X PATCH \
    -d '{
      "protection": {
        "enabled": true,
		"lock_branch":true,
		"required_status_checks": {
          "enforcement_level": "everyone",
          "contexts": [
            "default"
          ]
        }
      }
    }' \
    -s | json protection
	
	
	/
