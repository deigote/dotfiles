# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# Java stuff
export JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF8 -Xmx2048m -Xms256m -XX:PermSize=512M -XX:MaxPermSize=1024M"
JAVA_HOME=$HOME/local/jdk
if [ ! -d "$JAVA_HOME" ] ; then
	JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/
fi
if [ ! -d "$JAVA_HOME" ] ; then
	JAVA_HOME=/opt/java
fi
export JAVA_HOME
if [ -d "$JAVA_HOME/jre" ]; then
	export JRE_HOME="$JAVA_HOME/jre"
fi
export MVN_HOME=$HOME/local/maven
export GRAILS_HOME=$HOME/local/grails
export GROOVYSERV_HOME=$HOME/local/groovyserv
export GROOVY_HOME=$HOME/local/groovy

if [ ! -d "$JAVA_HOME/bin" ] && [ -d "$JRE_HOME" ] ; then
	export JAVA_HOME="$JRE_HOME"
fi

if [ -d "$JAVA_HOME" ] ; then
	PATH="$JAVA_HOME/bin:$PATH"
fi

if [ -d "$MVN_HOME" ] ; then
	PATH="$MVN_HOME/bin:$PATH"
	export MAVEN_OPTS=-Xmx512m
fi

if [ -d "$GRAILS_HOME" ] ; then
        PATH="$GRAILS_HOME/bin:$PATH"
fi

if [ -d "$GROOVYSERV_HOME" ] ; then
        PATH="$GROOVYSERV_HOME/bin:$PATH"
fi

if [ -d "$GROOVY_HOME" ] ; then
        PATH="$GROOVY_HOME/bin:$PATH"
fi

# Mysql stuff
MYSQL_HOME=$HOME/local/mysql
if [ -d "$MYSQL_HOME" ] ; then
        PATH="$MYSQL_HOME/bin:$MYSQL_HOME/support-files:$PATH"
fi

# Oracle stuff
export ORACLE_HOME=$HOME/local/oracle
# export LD_LIBRARY_PATH="$ORACLE_HOME/lib"
if [ -d "$ORACLE_HOME" ] ; then
	export TNS_ADMIN="$ORACLE_HOME"
fi

# sqlline stuff
export SQLLINE_HOME="$HOME/local/sqlline"
if [ -d "$SQLLINE_HOME" ] ; then
	export PATH="$SQLLINE_HOME:$PATH"
fi

# EC2 stuff
export EC2_HOME=$HOME/local/ec2-api-tools
export EC2_AMI_TOOLS_HOME=$HOME/local/ec2-ami-tools
export EC2_ACCOUNTS_HOME=$HOME/.ec2/
if [ -d "$EC2_HOME" ] ; then
	PATH="$EC2_HOME/bin:$PATH"
fi
if [ -d "$EC2_AMI_TOOLS_HOME" ] ; then
	PATH="$EC2_AMI_TOOLS_HOME/bin:$PATH"
fi
export EC2_URL=https://ec2.eu-west-1.amazonaws.com
export AWS_CLOUDFORMATION_HOME=$HOME/local/aws-cfn
if [ -d "$AWS_CLOUDFORMATION_HOME" ] ; then
        PATH="$AWS_CLOUDFORMATION_HOME/bin:$PATH"
fi

# JMeter stuff
JMETER_HOME="$HOME/local/jmeter"
if [ -d "$JMETER_HOME" ] ; then
        PATH="$JMETER_HOME/bin:$PATH"
fi

# Some more typical bin directories
MORE_BIN=`find $HOME/Proyectos/Osoco/scripts/ -type d -maxdepth 1 -mindepth 1 -name "[a-z]*"`
MORE_BIN="$MORE_BIN $HOME/Proyectos/personal/scripts $HOME/local/bin $HOME/bin /usr/local/bin /opt/bin"
for bin in $MORE_BIN ; do 
	if [ -d "$bin" ] ; then
		PATH="$bin:$PATH"
	fi
done

# Export path modifications
export PATH

# Set the editor as nano
export EDITOR=/usr/bin/nano

