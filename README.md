# globeco-debug-tools
Debug tools for the GlobeCo suite.  Can run in the same network as other containers.  Contains Postgres, Mongo, and Redis clients

## Kubernetes Deployment

To deploy the debug tools into your Kubernetes cluster:

1. Build and push the Docker image (if not already done):
   ```sh
   docker buildx build --platform linux/amd64,linux/arm64 -t kasbench/globeco-debug-tools:latest --push .
   ```

2. Deploy to Kubernetes:
   ```sh
   cd k8s
   ./deploy-globeco-debug-tools.sh
   ```

3. Shell into the debug pod:
   ```sh
   kubectl exec -it deploy/globeco-debug-tools -- bash
   ```

This will give you an interactive shell with access to common debugging tools, as well as Postgres, MongoDB, and Redis clients, inside your Kubernetes cluster.
