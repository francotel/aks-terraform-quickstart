# Configuration Flow:

# 1. ConfigMap (01): Defines the initial configuration, like enabled plugins for RabbitMQ.
kubectl apply -f 01-configmap-rabbitmq.yaml

# 2. Deployment (02): Starts the RabbitMQ container, using the configuration and mounting the ConfigMap volume.
kubectl apply -f 02-deployment-rabbitmq.yaml

# 3. Service (03): Provides an access point for other applications to communicate with RabbitMQ.
kubectl apply -f 03-service-rabbitmq.yaml

# 4. Deployment (04): Starts the Order Service container, which depends on RabbitMQ.
kubectl apply -f 04-deployment-order-service.yaml

# 5. Service (05): Provides an access point for the Order Service to communicate with other applications.
kubectl apply -f 05-service-order-service.yaml

# 6. Deployment (06): Starts the Product Service container, which also connects to the RabbitMQ service.
kubectl apply -f 06-deployment-product-service.yaml

# 7. Service (07): Provides an access point for the Product Service to communicate with other applications.
kubectl apply -f 07-service-product-service.yaml

# 8. Deployment (08): Starts the Store Front container, which uses the Order and Product Services.
kubectl apply -f 08-deployment-store-front.yaml

# 9. Service (09): Exposes the Store Front service to the outside world via a LoadBalancer.
kubectl apply -f 09-service-store-front.yaml
