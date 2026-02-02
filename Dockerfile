FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

COPY *.sln ./
COPY *.csproj ./
RUN dotnet restore "./MVCMovie2026-1.csproj"

COPY . .
WORKDIR /src
RUN dotnet publish -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime
WORKDIR /app
COPY --from=build /app/publish .

ENV ASPNETCORE_URLS=http://+80
ENV DOTNET_RUNNING_IN_CONTAINER=true
EXPOSE 80

ENTRYPOINT [ "dotnet","MVCMovie2026-1.dll"]