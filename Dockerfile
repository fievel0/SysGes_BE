FROM eclipse-temurin:21-jdk-alpine

WORKDIR /app

# Copia el código fuente y asigna permisos de ejecución a mvnw
COPY . ./
RUN chmod +x mvnw

# Construye la aplicación
RUN ./mvnw -DoutputFile=target/mvn-dependency-list.log -B -DskipTests clean dependency:list install

CMD ["sh", "-c", "java -jar target/*.jar"]
