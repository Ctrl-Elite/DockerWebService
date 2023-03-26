#See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:6.0-alpine AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine AS build
WORKDIR /src
COPY ["DockerWebService/DockerWebService.csproj", "DockerWebService/"]
RUN dotnet restore "DockerWebService/DockerWebService.csproj"
COPY . .
WORKDIR "/src/DockerWebService"
RUN dotnet build "DockerWebService.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "DockerWebService.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENV ASPNETCORE_URLS http://*:5000
ENTRYPOINT ["dotnet", "DockerWebService.dll"]