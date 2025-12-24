What Is This Project?
A production-ready load-balanced microservices system that demonstrates how to:

Run multiple Spring Boot instances (3 servers)
Use Nginx to distribute traffic across them
Achieve high availability and horizontal scaling
Test performance under load

*Development Tools
-Java JDK Run Spring Boot applications Windows 17+
-MavenBuild & dependency management +Spring BootBackend frameworkWindows3.2.0

*Load Balancing & Testing Tools
-Nginx	Load balancer & reverse proxy	Kali Linux	sudo systemctl start nginx
-Apache Bench (ab)	Load testing & benchmarking	Kali Linux	ab -n 1000 -c 10 http://localhost/
-curl	HTTP testing & debugging	Kali Linux	curl http://localhost/
-JMeter	Advanced load testing (optional)	Kali Linux	jmeter

=======HOW TO RUN=========== 
# 1. Clone project
git clone https://github.com/yourusername/spring-nginx-loadbalancer.git
cd spring-nginx-loadbalancer

# 2. Run automated setup
chmod +x setup-and-run.sh
./setup-and-run.sh

# 3. Test it
curl http://localhost/

# That's it! 🎉


