FROM openjdk:17-oracle

ARG JAR_FILE=target/find-links.jar
ARG JAR_LIB_FILE=target/lib/

# cd /usr/local/runme
WORKDIR /usr/local/runme

# copy target/find-links.jar /usr/local/runme/app.jar
COPY ${JAR_FILE} DemoApplication.jar

# copy project dependencies
# cp -rf target/lib/  /usr/local/runme/lib
ADD ${JAR_LIB_FILE} lib/

# java -jar /usr/local/runme/app.jar
ENTRYPOINT ["java","-jar","DemoApplication.jar"]