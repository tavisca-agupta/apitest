FROM microsoft/dotnet:2.1-aspnetcore-runtime AS base
WORKDIR /app
#EXPOSE 5555

FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR .
COPY . .
RUN dotnet build "API.sln" -c Release -o /app
RUN dotnet publish "API.sln" -c Release -o /app/publish

WORKDIR /app/publish
ENTRYPOINT ["dotnet", "API.dll"]

#FROM build AS publish
#RUN dotnet publish "API.sln" -c Release -o /app

#FROM base AS final
#WORKDIR /app
#COPY --from=publish /app .
#ENTRYPOINT ["dotnet", "API.dll"]

