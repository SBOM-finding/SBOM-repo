FROM openjdk:8-jdk-alpine as build
COPY . /usr/app
WORKDIR /usr/app
RUN chmod +x gradlew \
    && ./gradlew --version \
    && ./gradlew build
FROM openjdk:8-jre-alpine
COPY --from=build /usr/app/target/*.jar app.jar
EXPOSE 8080

ENTRYPOINT ["java","-jar","app.jar"]
