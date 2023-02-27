FROM openjdk:17-oracle

# cd /usr/local/runme
WORKDIR /build

RUN ./gradlew build /build/target/DemoApplication.jar
COPY --from=0 /build/target/DemoApplication.jar  /app/target/DemoApplication.jar
EXPOSE 8080
# java -jar /usr/local/runme/app.jar
ENTRYPOINT [ "java", "-jar", "/app/target/DemoApplication.jar", "--server.port=8080" ]