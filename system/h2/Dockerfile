FROM openjdk:11
WORKDIR /shared

# Automatically download the JAR during image build
ADD https://repo1.maven.org/maven2/com/h2database/h2/1.4.190/h2-1.4.190.jar .

# Start H2 server using the JAR inside the shared volume
CMD ["java", "-cp", "h2-1.4.190.jar", "org.h2.tools.Server", "-tcp", "-tcpAllowOthers", "-tcpPort", "9092", "-baseDir", "/"]
