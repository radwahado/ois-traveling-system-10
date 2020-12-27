# ois-traveling-system-10

We used the following tools during the development and setup of our application:
-	Xampp environment and Jetty server to serve our application
-	Widcodoc and Puppy to generate documentation for our ontology
-	MySQL as a relational database system
-	r2rml-fat.jar package to process our mappings 
-	shaclvalidate.bat package to execute our SHACL script

Steps to setup our applicaiton goes as follow:

### add the following to your hosts file 

```
127.0.0.1 group10travel.com
127.0.0.1 ontology.group10travel.com
127.0.0.1 data.group10travel.com
127.0.0.1 sparql.group10travel.com
```

### install Xampp, Jetty, Puppy
### extract contents from widoco_project folder to Xampp/htdocs folder
### two options to install our dataset
#### copy etc_fuseki\group10-tavel-db folder to etc\fuseki\databases\
#### copy etc_fuseki\group10-tavel-db.ttl file to etc\fuseki\databases\configuration\
#### change tdb:location in etc_fuseki\group10-tavel-db.ttl according to your pc
### or:
#### start jetty on port 8080
#### open http://localhost:8080/fuseki/index.html 
#### create a persistent dataset called group10-tavel-db
#### upload the provided group10travel-db.ttl file to the created dataset
#### add the following to etc\fuseki\configuration\group10-tavel-db.ttl and use the inferred_dataset instead of the default one. 

```
:inferred_dataset a ja:RDFDataset ;
	ja:defaultGraph :inference_model .

:inference_model a ja:InfModel ;
	ja:baseModel :tdb_graph ;
	ja:reasoner [
		ja:reasonerClass "openllet.jena.PelletReasonerFactory"
	] .
:tdb_graph a tdb:GraphTDB ;
	tdb:dataset :tdb_dataset_readwrite .

```
### copy jetty_webapp folder contents to jetty webapps directory
### add the following to xammp\apache\conf\extra\ httpd-vhosts.conf
```
<VirtualHost *:80>
	ServerName ontology.group10travel.com
	ServerAlias localhost
	DocumentRoot "D:/Programs/xammpp/htdocs/"
</VirtualHost>
<VirtualHost *:80>
	ServerName data.group10travel.com
	LoadModule proxy_module modules/mod_proxy.so
	LoadModule proxy_http_module modules/mod_proxy_http.so
	ProxyPreserveHost On
<Proxy *>
	Order allow,deny
	Allow from all
</Proxy>
	ProxyPass / http://localhost:8080/
	ProxyPassReverse / http://localhost:8080/
</VirtualHost>

<VirtualHost *:80>
	ServerName sparql.group10travel.com
	LoadModule proxy_module modules/mod_proxy.so
	LoadModule proxy_http_module modules/mod_proxy_http.so
	ProxyPreserveHost On
<Proxy *>
	Order allow,deny
	Allow from all
</Proxy>
	ProxyPass / http://localhost:8080/fuseki/group10-tavel-db/sparql
	ProxyPassReverse / http://localhost:8080/fuseki/group10-tavel-db/sparql
</VirtualHost>
```

### start apache on port 80 and Jetty on 8080

Now, the static documentation should be available via this link http://ontology.group10travel.com/index-en.html

Documentation for our individuals is accessible via http://data.group10travel.com.
For example: http://data.group10travel.com/Flight__SN8801

SPAQRL queries are executable via Fuseki
SPARQL endpoint is also accessible via http://sparql.group10travel.com  
