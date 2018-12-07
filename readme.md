## Quickstart

Bootstrap required environment with a help of Docker
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

Serve web application (default port is `:8080`)
```
$ cd /src/my-webapp
$ mvn clean install tomcat7:run-war
```

Run on a specific port
```
$ mvn tomcat7:run-war -Dmaven.tomcat.port=8181
```

Customize message
```
$ export message="My custom greetings"
```

### Launch infrastructure

```
$ cd terraform
$ terraform init
$ terraform apply
```
`ami-0ac019f4fcb7cb7e6`
```
sudo docker run -it --rm  -p 8181:8080 -v `pwd`/webapp:/usr/local/tomcat/webapps/ tomcat:8.0 /bin/bash
```
### Deploy
```
$ ansible-galaxy install geerlingguy.docker
$ cd ansible
$ ansible-playbook deploy.yml
```
