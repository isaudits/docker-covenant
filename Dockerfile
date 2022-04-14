# https://github.com/cobbr/Covenant/blob/master/Covenant/Dockerfile
# https://github.com/war-horse/docker-covenant/blob/master/Dockerfile

FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build

WORKDIR /app
RUN git clone --recurse-submodules https://github.com/cobbr/Covenant
WORKDIR /app/Covenant/Covenant
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS runtime
WORKDIR /app
COPY --from=build /app/Covenant/Covenant/out .
COPY --from=build /app/Covenant/Covenant/Data ./Data
EXPOSE 7443 80 443
ENTRYPOINT ["dotnet", "Covenant.dll"]

ENV COVENANT_USERNAME="covenantadmin" \
    COVENANT_PASSWORD="dammitman!!!" \
    COVENANT_COMPUTER_NAME="0.0.0.0" \
    COVENANT_PORT="7443"