#!/bin/sh

# The following executes the HelloWorld using load time weaving (ltw).  The aspectj javaagent is required.
# ltw is the most flexible way of using aspectj and is controled by passing an aspectj xml config line into the program.
# The example monitors a class using NewRelicas opposed to sysout which is used in the other examples.  Monitoring with
# StatsD or JavaSimon could be done in a similar way. Note -Dorg.automon=newrelic is not specified below.  Instead
# Automon recognizes that Metrics is in the class path and so uses it.

# java -Dorg.automon=newrelic -Dorg.aspectj.weaver.loadtime.configuration=file:config/hello-world-unwoven-aop.xml -javaagent:libs/aspectjweaver.jar -classpath ../automon/target/automon-1.0.3.jar:../helloworld_unwoven/target/helloworld_unwoven-1.0.3.jar:libs/newrelic-api-3.29.0.jar com.stevesouza.helloworld.HelloWorld
java -Dorg.aspectj.weaver.loadtime.configuration=file:config/hello-world-unwoven-aop.xml -javaagent:libs/aspectjweaver.jar -classpath ../automon/target/automon-1.0.3.jar:../helloworld_unwoven/target/helloworld_unwoven-1.0.3.jar:libs/newrelic-api-3.29.0.jar com.stevesouza.helloworld.HelloWorld

# to run the program in a loop for 1000 times (allows time to look at automon jmx in jconsole)
# java -Dorg.aspectj.weaver.loadtime.configuration=file:config/hello-world-unwoven-aop.xml -javaagent:libs/aspectjweaver.jar -classpath ../automon/target/automon-1.0.3.jar:../helloworld_unwoven/target/helloworld_unwoven-1.0.3.jar:libs/newrelic-api-3.29.0.jar com.stevesouza.helloworld.HelloWorld 1000
