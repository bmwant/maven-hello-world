### Q&A

* How reliable and available is your deployment? 

Due to idempotent nature of Ansible and Terraform deployment is very reliable. 
You can relaunch/resume it in case of any issues and easily update it in
declarative way.

In terms of availability there is no rolling deployment, so you'll experience
a little downtime when restarting a service after new version was deployed.

* What could affect this?

Network connection issues or issues with provider itself (AWS) could affect
otherwise smooth process of deployment.

* How automated is your answer?

It's completely automated. We can add a `Makefile` of bash script chaining 
together all the steps, but on a real application it anyway should be done 
separately on your continuous integration server as different stages 
(build/test/deploy).

* How suitable is the process to maintenance and updates? 

For the maintenance we can just route our traffic to a different 
instance/container showing maintenance page, so it fits nicely. When talking
about application update

* What changes would you make to improve the deployment process or improve maintainability?

We can containerize our application itself and not distribute `war` file and 
run it within container. We can set up blue/green deployment or any other process
making zero downtime for our application. We can store Terraform state on S3 instead
of locally making it easier to multiple developers to maintain.

* How scalable is your answer? 

It's pretty scalable. You can scale by adding AWS instances and balancer will
route all the traffic between them or you can scale on container level creating
more docker containers with application (via Docker Compose/Swarm).

* What would you do allow the deployment to handle more traffic?

Add more instances in different regions. In case of our web application we can 
also add some CDN to quickly serve static data.

* How secure is your answer?

No sensitive information is included in the code itself. All variables
should be provided per user/deployment. In case some parameters needed to
be stored/shared within version control system we can use Ansible Vault for that.
 
* Would seeing your template expose any sensitive information?

Actually no, but in this particular example we have security group allowing 
incoming/outcoming access to all the available ports, so seeing this template
would reveal potential information about poor infrastructure security.

* How could you preserve log data from these instances, even if they terminate?

I can store logs (or create periodical backups) somewhere else (e.g. S3 bucket)
or use ELK/DataDog/CloudWatch third party services to publish data there.
