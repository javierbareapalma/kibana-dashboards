#!/bin/bash

kibana_url="https://elastic:AHqn4gC00wY2GK8I840f67uP@kibana-elastic.apps.prd1.gn2.quattro.rijksapps.nl"
path="."
while read line
do
	file=$(echo $line | cut -d':' -f1)
	dashboard=$(echo $line | cut -d':' -f2)
	curl -k -X POST -H "Content-Type: application/json" -H "kbn-xsrf: true" "$kibana_url/api/kibana/dashboards/import" -d @$path/$file.json
done < dashboards
