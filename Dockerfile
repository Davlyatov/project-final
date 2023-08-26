FROM maven
COPY . .
RUN mvn install -DskipTests

FROM openjdk:17
WORKDIR /app
COPY target/jira-1.0.jar jira-app.jar
COPY ./resources /app/resources
ENTRYPOINT ["java","-jar","/app/jira-app.jar"]