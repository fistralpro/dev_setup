# most vanilla dockerfile I can think of for springboot
# we cannot use docker scan with alpine on WSL2
FROM eclipse-temurin:11-alpine

RUN mkdir /opt/app
COPY target/app.jar /opt/app
CMD ["java", "-jar", "/opt/app/app.jar"]

#how do we sort out PID1 zombie issue?
