FROM centos:7.8.2003

# 更新版本1
MAINTAINER runcare<larrygui@foxmail.com>

ARG JRE_VERSION="server-jre-8u251-linux-x64.tar.gz"
#ENV	JRE_DOWNLOAD_URL  http://cdn01.qikesh.com/jre/$JRE_VERSION ##备用下载地址
ENV	JRE_DOWNLOAD_URL  https://darensh.oss-cn-shanghai.aliyuncs.com/jre/$JRE_VERSION

RUN mkdir -p /tmp/dependencies  \
    mkdir -p /usr/local/java  \
	&& curl -L --silent $JRE_DOWNLOAD_URL >  /tmp/dependencies/$JRE_VERSION  \
	&& tar -xzf /tmp/dependencies/$JRE_VERSION -C /usr/local/java  \
	&& rm -rf /tmp/dependencies

#如果修改JRE_VERSION中的版本号，需要对应修改JAVA_HOME路径中的版本
ENV JAVA_HOME /usr/local/java/jdk1.8.0_251
ENV PATH $PATH:$JAVA_HOME/bin
#设置时区为上海
ENV TZ Asia/Shanghai

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
