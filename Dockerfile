FROM liquibase/liquibase:latest
ENV URL=jdbc:postgresql://postgresql:5432/db
ENV USERNAME=user
ENV PASSWORD=pass
ENV CHANGELOGFILE=changelog.sql
RUN chown -R 1001:0 /liquibase 
USER 1001
CMD ["sh", "-c", "docker-entrypoint.sh --url=${URL} --username=${USERNAME} --password=${PASSWORD} --classpath=/liquibase/changelog --changeLogFile=${CHANGELOGFILE} update"]
