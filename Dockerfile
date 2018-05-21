FROM hseeberger/scala-sbt:8u171_2.12.6_1.1.5 as builder
WORKDIR /build
# Cache dependencies first
COPY project project
COPY build.sbt .
RUN sbt update
# Then build
COPY . .
RUN sbt stage

FROM openjdk:8u171-slim
WORKDIR /app
COPY --from=builder /build/target/universal/stage/. .
RUN mv bin/$(ls bin | grep -v .bat) bin/start
CMD ["./bin/start"]