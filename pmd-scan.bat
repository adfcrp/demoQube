:: RUN PMD ANALYSIS
pmd -dir .\force-app\main\default -f xml -language apex -R rulesets/apex/quickstart.xml -cache pmdcache -failOnViolation false> pmd-report.xml
