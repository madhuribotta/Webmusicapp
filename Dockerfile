FROM maven:3.5-jdk-8-alpine as build
COPY ./ /app/Webmusicapp/
WORKDIR /app/Webmusicapp/
RUN mvn install

FROM tomcat:8.5.41-jdk8-slim
COPY --from=build Webmusicapp/target/Webmusicapp.war /usr/local/tomcat/webapps
