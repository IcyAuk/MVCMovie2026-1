# set base image to .NET 9 SDK, rename it build
# then use ASP.NET runtime to run, rename it runtime

# SDK contains the compiler, dotnet CLI, publish toolings...
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build

# set the working dir inside the container image.
# think of sql CREATE IF NOT EXISTS
WORKDIR /src

COPY *.sln ./
COPY MVCMovie2026-1/*.csproj ./MVCMovie2026-1/
#downloads packages and writes dependency files
RUN dotnet restore

# copy the rest (M, V, C, wwwroot, etc)
COPY . .
WORKDIR /src/MVCMovie2026-1

# publish
# -c Release : builds the release config
# -o placeds published files in defined dir
RUN dotnet publish -c Release -o /app/publish

# Start a runtime-only image that contains ASP.NET Core runtime
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime
WORKDIR /app

# copy from the build output into the runtime image
COPY --from=build /app/publish .

# configure app to listen to port 80
ENV ASPNETCORE_URLS=http://+:80
EXPOSE 80

ENTRYPOINT [ "dotnet","MVCMovie2026-1.dll" ]