```
docker pull maven
docker run -it --rm --name my-maven-project -v `pwd`:/src maven /bin/bash
```


```
mvn archetype:generate -DgroupId=com.mycompany.app -DartifactId=my-app -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false
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
mvn install tomcat:run-war
```
