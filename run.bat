@ECHO OFF

IF "%MAVEN_OPTS%" == "" (
    ECHO The environment variable 'MAVEN_OPTS' is not set, setting it for you
    SET MAVEN_OPTS=-Xms256m -Xmx2G -XX:PermSize=300m
)
ECHO MAVEN_OPTS is set to '%MAVEN_OPTS%'

REM Build both AMPs (alpaca-repo and alpaca-share) from the aggregator pom.
REM -Ddependency.surf.version is required because the alfresco-platform-distribution
REM BOM references that property without defining it anywhere in its inheritance chain.
mvn clean install -Pamp-to-war -Ddependency.surf.version=6.11 %*
