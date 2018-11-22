echo "Current hostname is $HOSTNAME.clickhouse.$NAMESPACE.$KUBERNETES_DOMAIN"
echo "Current cluster name is $CLUSTER_NAME"

sed -i "s/NODENAME/$HOSTNAME/" /etc/clickhouse-server/config.xml
sed -i "s/NAMESPACE/$NAMESPACE/" /etc/clickhouse-server/config.xml
sed -i "s/KUBERNETES_DOMAIN/$KUBERNETES_DOMAIN/" /etc/clickhouse-server/config.xml
sed -i "s/CLUSTER_NAME/$CLUSTER_NAME/" /etc/clickhouse-server/config.xml

NODE_ID=$(echo $(hostname) | awk '{print substr($0,length-2,1)}')

cp /opt/macro-$NODE_ID.xml /etc/clickhouse-server/macro.xml

/usr/bin/clickhouse-server --config=${CLICKHOUSE_CONFIG}
