FROM openjdk:8-jdk-alpine as build
COPY . /project
WORKDIR /project
RUN chmod +x gradlew \
    && ./gradlew --version \
    
    && cp ./target/learning-spring-boot-0.0.1.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","app.jar"]
