# Base image for runtime
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 5122

# Build image
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src

# Copy the project file and restore dependencies
COPY ["./eWellness.Mailer/eWellness.Mailer.csproj", "eWellness.Mailer/"]
RUN dotnet restore "eWellness.Mailer/eWellness.Mailer.csproj"

# Copy the rest of the source code
COPY . .

# Build the project
WORKDIR "/src/eWellness.Mailer"
RUN dotnet build "eWellness.Mailer.csproj" -c Release -o /app/build

# Publish the project
FROM build AS publish
WORKDIR "/src/eWellness.Mailer"
RUN dotnet publish "eWellness.Mailer.csproj" -c Release -o /app/publish /p:UseAppHost=false

# Final stage: runtime
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .

# Define the entry point
ENTRYPOINT ["dotnet", "eWellness.Mailer.dll"]
