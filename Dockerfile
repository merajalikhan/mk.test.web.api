## from local 

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
#COPY ["MK.Test.Web/MK.Test.Web.csproj", "MK.Test.Web/"]
COPY ["MK.Test.Web.csproj", "MK.Test.Web/"]

RUN dotnet restore "MK.Test.Web/MK.Test.Web.csproj"
WORKDIR "/src/MK.Test.Web"
COPY . .

RUN dotnet build "MK.Test.Web.csproj" -c Release -o /app/build
#RUN dotnet build "MK.Test.Web/MK.Test.Web.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "MK.Test.Web.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "MK.Test.Web.dll"]

# from pipeline
#FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
#WORKDIR /app
#EXPOSE 80

#FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
#WORKDIR /src
#COPY ["MK.Test.Web/MK.Test.Web.csproj", "MK.Test.Web/"]

#RUN dotnet restore "MK.Test.Web/MK.Test.Web.csproj"
#COPY . .
#WORKDIR "/src/MK.Test.Web"
#RUN dotnet build "MK.Test.Web.csproj" -c Release -o /app/build

#FROM build AS publish
#RUN dotnet publish "MK.Test.Web.csproj" -c Release -o /app/publish

#FROM base AS final
#WORKDIR /app
#COPY --from=publish /app/publish .
#ENTRYPOINT ["dotnet", "MK.Test.Web.dll"]