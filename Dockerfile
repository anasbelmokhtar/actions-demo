FROM alpine:latest
RUN apk --update add openjdk8-jre
USER root
RUN gradle clean build
COPY DemoApplication.jar app.jar
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar"]

#FROM openjdk:17-oracle

# cd /usr/local/runme

#WORKDIR /build

#RUN ./gradlew build /build/target/DemoApplication.jar
#COPY --from=0 /build/target/DemoApplication.jar  /app/target/DemoApplication.jar
#EXPOSE 8080
# java -jar /usr/local/runme/app.jar
#ENTRYPOINT [ "java", "-jar", "/app/target/DemoApplication.jar", "--server.port=8080" ]



# using multistage docker build
# ref: https://docs.docker.com/develop/develop-images/multistage-build/

# temp container to build using gradle
#FROM gradle:7-jdk19-alpine AS TEMP_BUILD_IMAGE
#ENV APP_HOME=/usr/app/
#WORKDIR $APP_HOME
#COPY build.gradle settings.gradle $APP_HOME

#COPY gradle $APP_HOME/gradle
#COPY --chown=gradle:gradle . /home/gradle/src
#USER root
#RUN chown -R gradle /home/gradle/src

#RUN gradle build || return 0
#COPY . .
#RUN gradle clean build

# actual container
#FROM adoptopenjdk/openjdk11:alpine-jre
#ENV ARTIFACT_NAME=DemoApplication.jar
#ENV APP_HOME=/usr/app/

#WORKDIR $APP_HOME
#COPY --from=TEMP_BUILD_IMAGE $APP_HOME/build/libs/$ARTIFACT_NAME .

#EXPOSE 8080
#ENTRYPOINT exec java -jar ${ARTIFACT_NAME}
