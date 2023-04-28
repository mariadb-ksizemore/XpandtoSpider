![MariaDB](https://mariadb.com/wp-content/uploads/2019/11/mariadb-logo_blue-transparent.png)

### MariaDB Distributed SQL to Analytics with Spider Engine Demo 

## Summary

### MariaDB ColumnStore 
MariaDB ColumnStore is a columnar storage engine that utilizes a massively parallel distributed data architecture. It was built by porting InfiniDB to MariaDB and has been released under the GPL license.

MariaDB ColumnStore is designed for big data scaling to process petabytes of data, linear scalability and exceptional performance with real-time response to analytical queries. It leverages the I/O benefits of columnar storage, compression, just-in-time projection, and horizontal and vertical partitioning to deliver tremendous performance when analyzing large data sets.

### MariaDB Xpand 
MariaDB Xpand is a distributed SQL database with high availability, fault tolerance, and write scaling.

MariaDB Xpand supports ACID-compliant distributed SQL for modern web applications with massive workloads that require high performance and strong consistency, such as online transactional processing (OLTP). MariaDB Xpand can adapt to changes in workload or capacity requirements with elastic scale-out and scale-in. When more capacity is required, more Xpand nodes can be added. When workload is reduced, Xpand nodes can be removed.

### MariaDB Spider Engine 

MariaDB Spider Engine creates "virtual" Spider Tables on a Spider enabled node that clients and applications can query as if they were regular tables. For Federated Spider Tables, the Enterprise Spider storage engine uses a MariaDB foreign data wrapper to query a Data Table on one or more Data Nodes. For ODBC Spider Tables, the Enterprise Spider storage engine uses an ODBC foreign data wrapper to query an ODBC Data Source.



This is a Docker (https://hub.docker.com/r/mariadb/) project to provision MariaDB Xpand and MariaDB Columnstore with Spider Engine:

*   1 **MariaDB Xpand** Distributed SQL Developer image for functional testing
*   1 **MariaDB Columnstore** MariaDB Columnstore Docker Image with Spider Engine


![Xpand to Columnstore with Spider Docker](https://github.com/mariadb-ksizemore/XpandtoSpider/blob/cb48e01e05e9262f00d4da0f984c45f23d502364/XpandtoSpider.png)

## Requirements

Please install the following software packages before you begin.

*   [Docker](https://www.docker.com/get-started)
*   [Xpand](https://hub.docker.com/r/mariadb/xpand-single) docker image image currently supports amd64/x86-64 architecture. Apple M1, ARM, s390x, and others are not supported.
* Minimum system requirements:
        6GiB storage
        2GiB free memory
        2 CPU cores / threads

 More information [here](https://hub.docker.com/r/mariadb/xpand-single).


## Instructions:

Open a terminal window and clone the repository:

1.  `git clone https://github.com/mariadb-ksizemore/XpandtoSpider.git`
2.  `cd` into the newly cloned folder
3.  `docker compose up -d`
    to prepare and start the Docker images
4.  `docker exec -it xpd1 xpd_setup` 
    Download the sample bts data and import into the Xpand Docker node
5.  `docker exec -it mcs1 bootstrap`
    Prepare the Columnstore node and set up the sample bts Spider and Columnstore tables 
6.  `docker exec -it mcs1 mariadb`
    Login to Columnstore MaraiDB 
7. Start testing Spider Tables and Inserting data into Columnstore Tables

    `INSERT INTO bts.airlines_cs SELECT * FROM bts.airlines_spdr;`

    `INSERT INTO bts.airports_cs SELECT * FROM bts.airports_spdr;`
    
    `INSERT INTO bts.flights_cs SELECT * FROM bts.flights_spdr;`

8. Run [sample queries](https://github.com/mariadb-ksizemore/XpandtoSpider/tree/master/queries) in Queries directory to test performance in Columnstore
