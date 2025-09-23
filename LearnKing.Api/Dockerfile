# Build
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src
COPY LearnKing.Api/*.csproj ./LearnKing.Api/
RUN dotnet new tool-manifest -o . && dotnet tool restore || true
RUN dotnet restore LearnKing.Api/LearnKing.Api.csproj
COPY . .
RUN dotnet publish LearnKing.Api/LearnKing.Api.csproj -c Release -o /app/publish /p:UseAppHost=false
# Runtime
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime
WORKDIR /app
COPY --from=build /app/publish .
ENV ASPNETCORE_URLS=http://+:86
EXPOSE 86
HEALTHCHECK --interval=30s --timeout=5s --retries=3 CMD wget -qO- http://localhost:86/health || exit 1
ENTRYPOINT ["dotnet", "LearnKing.Api.dll"]