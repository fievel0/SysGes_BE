# Usa una imagen base de Maven con JDK 11 (puedes cambiar la versión según sea necesario)
FROM maven:3.8.6-openjdk-11-slim AS build

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el código fuente de tu proyecto al contenedor
COPY . /app

# Da permisos de ejecución al script mvnw (si es necesario en un entorno Linux)
RUN chmod +x ./mvnw

# Ejecuta Maven para descargar las dependencias e instalar los artefactos
RUN ./mvnw clean dependency:list install

# Expone el puerto 8080 (si tu aplicación usa este puerto)
EXPOSE 8080

# Comando para ejecutar tu aplicación (ajusta según tu proyecto)
CMD ["java", "-jar", "target/mi-aplicacion.jar"]
