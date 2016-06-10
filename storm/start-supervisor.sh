# docker net aliases mean these env vars dont get defined, give them defaults
${ZK_PORT_2181_TCP_ADDR:=zk}
${NIMBUS_PORT_6627_TCP_ADDR:=nimbus}
sed -i -e "s/%zookeeper%/$ZK_PORT_2181_TCP_ADDR/g" $STORM_HOME/conf/storm.yaml
sed -i -e "s/%nimbus%/$NIMBUS_PORT_6627_TCP_ADDR/g" $STORM_HOME/conf/storm.yaml

echo "storm.local.hostname: `hostname -i | cut -d ' ' -f1`" >> $STORM_HOME/conf/storm.yaml

supervisord
