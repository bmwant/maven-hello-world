```
docker pull maven
docker run -it --rm --name my-maven-project -v `pwd`:/src maven /bin/bash
```

Generate simple web application
```
mvn archetype:generate \
	-DarchetypeGroupId=org.apache.maven.archetypes \
	-DarchetypeArtifactId=maven-archetype-webapp \
	-DarchetypeVersion=1.3 \
	-DgroupId=com.mycompany.app \
	-DartifactId=my-webapp \
	-DinteractiveMode=false
```


Create war file `/src/my-webapp/target/my-webapp.war`
```
mvn war:war
```

Serve web application
```
mvn clean install tomcat7:run
mvn install tomcat:run-war
```
