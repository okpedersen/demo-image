FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
WORKDIR /app

# Dockerfile assumes src/ is used as context

# Copy csproj and restore as distinct layers
COPY src/demo-image.csproj src/
RUN dotnet restore src/demo-image.csproj

# Copy everything else and build
COPY . .
RUN dotnet publish src/demo-image.csproj -c Release -o /app/out

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "demo-image.dll"]
EXPOSE 80

