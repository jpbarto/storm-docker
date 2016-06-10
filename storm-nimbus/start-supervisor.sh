export IP=`hostname -i | cut -d ' ' -f1`
# provide this env var with a default in case its unset
${ZK_PORT_2181_TCP_ADDR:=zk}
sed -i -e "s/%zookeeper%/$ZK_PORT_2181_TCP_ADDR/g" $STORM_HOME/conf/storm.yaml
sed -i -e "s/%nimbus%/$IP/g" $STORM_HOME/conf/storm.yaml

echo "storm.local.hostname:" ${IP} >> $STORM_HOME/conf/storm.yaml

supervisord -c /etc/supervisor/supervisord.conf
