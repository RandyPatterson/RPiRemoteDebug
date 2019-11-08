# run the container using the "--device /dev/gpiomem" parameter to give it access to GPIO

FROM  mcr.microsoft.com/dotnet/core/runtime:3.0.0-buster-slim-arm32v7
WORKDIR /app
COPY ./bin/Debug/netcoreapp3.0/linux-arm .
RUN chmod 777 ./rpiworker
ENTRYPOINT [ "./rpiworker" ]