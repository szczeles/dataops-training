FROM bde2020/hadoop-base:2.0.0-hadoop2.7.4-java8

WORKDIR /opt

RUN echo 'deb http://archive.debian.org/debian jessie-backports main' > /etc/apt/sources.list && \
echo 'deb http://deb.debian.org/debian jessie main' >> /etc/apt/sources.list && \
echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/jessie && \
apt update && \
apt install -y python3 &&  \
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
python3 get-pip.py && \
pip install pyzmq==17 jupyter

RUN  curl -O https://www-eu.apache.org/dist/spark/spark-2.4.4/spark-2.4.4-bin-hadoop2.7.tgz && \
tar zxf spark-2.4.4-bin-hadoop2.7.tgz && \
ln -s spark-2.4.4-bin-hadoop2.7 spark && \
rm spark-2.4.4-bin-hadoop2.7.tgz

ENV PYSPARK_PYTHON python3
ENV PATH /opt/spark/bin:$PATH
ENV PYTHONPATH /opt/spark/python/lib/pyspark.zip:/opt/spark/python/lib/py4j-0.10.7-src.zip
ENV SPARK_DIST_CLASSPATH /etc/hadoop:/opt/hadoop-2.7.4/share/hadoop/common/lib/*:/opt/hadoop-2.7.4/share/hadoop/common/*:/opt/hadoop-2.7.4/share/hadoop/hdfs:/opt/hadoop-2.7.4/share/hadoop/hdfs/lib/*:/opt/hadoop-2.7.4/share/hadoop/hdfs/*:/opt/hadoop-2.7.4/share/hadoop/yarn/lib/*:/opt/hadoop-2.7.4/share/hadoop/yarn/*:/opt/hadoop-2.7.4/share/hadoop/mapreduce/lib/*:/opt/hadoop-2.7.4/share/hadoop/mapreduce/*:/contrib/capacity-scheduler/*.jar
ENV SPARK_HOME /opt/spark
ENV HADOOP_CONF_DIR /etc/hadoop

COPY start.sh /start.sh

RUN echo '<configuration><property><name>hive.metastore.uris</name><value>thrift://hive-metastore:9083</value></property></configuration>' > /opt/spark/conf/hive-site.xml

EXPOSE 8888

CMD /start.sh
