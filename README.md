# Movie CRUD (Spring / JPA / JSP)

Simple CRUD web application for managing movies. Uses Spring MVC, JPA (Jakarta Persistence), Hibernate and JSP views.

## Features
- Create, read, update, delete movies
- JSP-based UI (add.jsp, edit.jsp, view.jsp, main.jsp)
- JPA + Hibernate for persistence
- Auto DDL (hibernate.hbm2ddl.auto = update) — DB schema updates on run

## Tech stack
- Java 11+ (recommended)
- Maven
- Jakarta Persistence 3.0 / Hibernate
- MySQL (or compatible JDBC)
- Servlet container (Apache Tomcat 9+)

## Project structure (important folders)
- src/main/java — application code (controller, dao, entity, config)
- src/main/resources/META-INF/persistence.xml — JPA configuration (edit DB creds here)
- src/main/webapp — JSP pages and web.xml
- target — build outputs (do not commit to git)

## Prerequisites
- JDK 11 or newer installed and available in PATH
- Maven installed
- MySQL server running (or change URL to match another DB)
- Tomcat 9+ (if deploying war manually)

## Setup (Windows PowerShell commands)
1. Clone repository (if not already)
```powershell
git clone https://github.com/Guruprasad619/Spring-CRUD.git
cd 'C:\Users\LENOVO\eclipse-workspace\movie_crud'
```

2. Configure database
- Edit `src/main/resources/META-INF/persistence.xml` to set your DB URL, user and password.
- Do NOT commit real passwords to source control. Use environment-specific config or secrets management for production.


## Build and run

Option A — Package and deploy to Tomcat:
```powershell
mvn clean package
# copy resulting WAR from target/ to %CATALINA_HOME%\webapps\ and start Tomcat
```
Then open:
http://localhost:8080/<artifact-name>/main.jsp
(artifact-name is the project artifactId / war name)

Option B — Run in embedded container (if configured) or use your IDE to run as a server.

## How to use
- Open the main page (`main.jsp`) in browser.
- Use links to add, edit, view and delete movies.
- JSP pages are in `src/main/webapp/`:
  - add.jsp
  - edit.jsp
  - view.jsp
  - main.jsp

## Database notes
- Default DB name in provided config: `movies` (persistence.xml uses `createDatabaseIfNotExist=true`)
- Hibernate is set to `update` DDL mode — it will create/alter tables automatically.
- If you prefer to create DB manually:
```sql
CREATE DATABASE movies CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

## Troubleshooting
- "Failed to push refs" / remote has commits:
  - Fetch and rebase:
    ```powershell
    git fetch origin
    git pull --rebase origin main   # or replace main with master if applicable
    ```
  - Resolve conflicts, then:
    ```powershell
    git add <files>
    git rebase --continue
    git push -u origin main
    ```
  - To overwrite remote (dangerous): `git push --force origin main`

- If application cannot connect to DB: verify JDBC URL, user, password and that MySQL accepts connections from localhost and the configured port.

- If JSPs not found or 404: ensure WAR deployed to Tomcat webapps and Tomcat started. Check web.xml and console logs.

## Security & cleanup
- Remove generated files from version control (target/).
- Move credentials out of `persistence.xml` for production. Use environment variables or a secure vault.

## Where to look in code
- Controller: `src/main/java/movie_crud/controller/movieController.java`
- DAO: `src/main/java/movie_crud/dao/MovieDao.java`
- Entity: `src/main/java/movie_crud/entity/Movie.java`
- JPA config: `src/main/resources/META-INF/persistence.xml`
- Web views: `src/main/webapp/*.jsp`

