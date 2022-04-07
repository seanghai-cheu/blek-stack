
printf "Waiting for Elasticsearch availability...\n";
printf "=====================================================\n";
until curl -s --cacert ${ELASTIC_DIR}/config/ca.crt https://elasticsearch:9200 | grep -q "missing authentication credentials"; do sleep 30; done;

printf "Setting kibana_system password.\n";
printf "=====================================================\n";
until curl -s -X POST --cacert ${ELASTIC_DIR}/config/ca.crt -u ${ELASTIC_USERNAME}:${ELASTIC_PASSWORD} -H "Content-Type: application/json" https://elasticsearch:9200/_security/user/${KIBANA_USERNAME}/_password -d "{\"password\":\"${KIBANA_PASSWORD}\"}" | grep -q "^{}"; do sleep 10; done;

printf "\n\n\n\n\n";
printf "===========================================================\n";
printf " ====    ====   =   =   ====   =====    ====  ===== ====== \n";
printf "=    =  =    =  ==  =  =    =  =    =  =    =   =   =      \n";
printf "=       =    =  = = =  =       =====   ======   =   ====== \n";
printf "=    =  =    =  =  ==  =   ==  =    =  =    =   =        = \n";
printf " ====    ====   =   =   ====   =    =  =    =   =   ====== \n";
printf "===========================================================\n";