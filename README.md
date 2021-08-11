# REPSOL PEMKWSP

## Requirements for Scanners

For scan SFDX Projects, there would be installed the next stack:

* Install [SonarQube](https://www.sonarqube.org) in localhost or Docker container

* Install [SonarScanner](https://docs.sonarqube.org/latest/analysis/scan/sonarscanner/) at machine of project

* Install [PMD Plugin](https://docs.sonarqube.org/latest/setup/install-plugin/) from SonarQube Marketplace

* Install [Salesforce Sonar Plugin](https://github.com/SalesforceFoundation/salesforce-sonar-plugin) manually from Project at Github

* Install [PMD Source Code Analyst](https://pmd.github.io/latest/pmd_userdocs_installation.html) at machine of project

---
## Configurations

### Step 1: Compile the Salesforce Sonar Plugin

From Github **Salesforce Sonar Plugin** repository, compile the plugin using maven.

```bat
> mvn install
```

Copy the resulting sonar-salesforce-pmd-1.x.x-SNAPSHOT.jar file to your SonarQube plugins directory. After that, reset the SonarQube for plugin could be installed.

### Step 2: Build the Sonar Properties file in SFDX Project

In the SFDX Project directory make a `sonar-project.properties` with the next documentation [here](https://docs.sonarqube.org/latest/analysis/analysis-parameters/).

Example:
```
sonar.projectKey = PROJECT_DEMO 
sonar.projectName = PROJECT DEMO
sonar.sources = force-app/
sonar.sourceEncoding = UTF-8
sonar.host.url=http://localhost:9000
sonar.login = <your_sonarqube_username>
sonar.password = <your_sonarqube_password>
```

### Step 3: Create Environment Variables

Set the environment variables for the next:
* PMD `\bin` directory
* SonarQube `\bin` directory
* SonarScanner `\bin` directory

---
## Execute Scanners
### Step 1: PMD for Apex

Run a PMD scan against your Apex files, using the quickstart ruleset. Save the results to a file in your working directory.

```bat
> pmd.bat -dir .\force-app\main\default -f xml -language apex -R rulesets/apex/quickstart.xml -cache pmdcache -failOnViolation false> pmd-report.xml
```

or just Run the pmd-scan.bat file

```bat
> .\pmd-scan.bat
```

In your SonarQube instance, go to *Administration > Configuration > Salesforce-PMD* and set the path name of your results file. In this case, `.\pmd-report.xml`.

### Step 2: Sonar Scanner

Run with Sonar Scanner the `sonar-project.properties` file.

```bat
> sonar-scanner
```

Sonar Scanner will recognize the `pmd-report.xml` file result from the PMD execution.