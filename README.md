# CloudCart E-Commerce Microservices

Production-style e-commerce microservices project with React, Node.js, MySQL, Redis, Kubernetes, Ingress, Prometheus, and Grafana.
# cloudcart-microservicepeoject
Project Workflow (README)
                CloudCart Workflow

                +------------------+
                |      User        |
                +--------+---------+
                         |
                         v
                +------------------+
                |    Frontend      |
                | (React + Nginx)  |
                +--------+---------+
                         |
                         v
                +------------------+
                |   API Gateway    |
                +--------+---------+
                         |
      -----------------------------------------------
      |         |          |         |              |
      v         v          v         v              v
+-----------+ +-----------+ +-----------+ +---------------+
|   Auth    | |   User    | | Product   | | Inventory     |
|  Service  | |  Service  | |  Service  | |   Service     |
+-----------+ +-----------+ +-----------+ +---------------+
                                         |
                                         v
                                   +-----------+
                                   |   Cart    |
                                   |  Service  |
                                   +-----------+
                                         |
                                         v
                                   +-----------+
                                   |   Order   |
                                   |  Service  |
                                   +-----------+
                                         |
                                         v
                                   +-----------+
                                   |  Payment  |
                                   |  Service  |
                                   +-----------+
                                         |
                                         v
                                   +-----------+
                                   | Shipping  |
                                   |  Service  |
                                   +-----------+
                                         |
                                         v
                                   +-----------+
                                   |Notification|
                                   |  Service   |
                                   +-----------+

                 ------------------------------
                 |         Databases          |
                 ------------------------------
                 MySQL   <--->   Redis

                 ------------------------------
                 |        Monitoring          |
                 ------------------------------
                 Prometheus ---> Grafana

                 ------------------------------
                 |      Containerization      |
                 ------------------------------
                 Docker Images

                 ------------------------------
                 |      Orchestration         |
                 ------------------------------
                 Kubernetes (Deployments,
                 Services, Ingress, HPA)
Technologies Used
Frontend: React, Nginx
Backend: Node.js, Express.js
API Gateway: Express + HTTP Proxy
Database: MySQL
Cache: Redis
Containerization: Docker
Orchestration: Kubernetes
Monitoring: Prometheus, Grafana
Version Control: Git & GitHub
