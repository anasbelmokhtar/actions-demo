FROM openjdk:17-oracle

ARG JAR_FILE=DemoApplication.jar
#ARG JAR_LIB_FILE=target/lib/

# cd /usr/local/runme
WORKDIR /build

# copy target/find-links.jar /usr/local/runme/app.jar
COPY ${JAR_FILE} /DemoApplication.jar

# copy project dependencies
# cp -rf target/lib/  /usr/local/runme/lib
ADD ${JAR_LIB_FILE} lib/

RUN gradle build /build/target/DemoApplication.jar
COPY --from=0 /build/target/DemoApplication.jar  /app/target/DemoApplication.jar
EXPOSE 8080
# java -jar /usr/local/runme/app.jar
ENTRYPOINT ["java","-jar","DemoApplication.jar"]