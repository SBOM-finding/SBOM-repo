FROM openjdk:8-jdk-alpine as build
COPY . /usr/app
WORKDIR /usr/app
RUN chmod +x gradlew \
    && ./gradlew --version \
    && ./gradlew build
    && cp ./target/learning-spring-boot-0.0.1.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","app.jar"]
