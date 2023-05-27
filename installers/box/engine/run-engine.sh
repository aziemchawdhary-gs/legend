#!/bin/bash

export CP=`find /app/engine/lib -name '*.jar' | egrep "shaded|bc" | tr '\n' ':'`
java -cp $CP \
-XX:+ExitOnOutOfMemoryError \
-XX:MaxRAMPercentage=60 \
-agentlib:jdwp=transport=dt_socket,address=*:8000,server=y,suspend=n \
-Xss4M \
-Dfile.encoding=UTF8 \
org.finos.legend.engine.server.Server server $ENGINE_HOME/config/config.json
