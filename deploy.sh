docker build -t hd719/complex-client:latest -t hd719/complex-client:$SHA -f ./client/Dockerfile ./client
docker build -t hd719/complex-server:latest -t hd719/complex-server:$SHA -f ./server/Dockerfile ./server
docker build -t hd719/complex-worker:lastest -t hd719/complex-worker:$SHA -f ./worker/Dockerfile ./worker

docker push hd719/complex-client:latest
docker push hd719/complex-server:lastest
docker push hd719/complex-worker:lastest

docker push hd719/complex-client:$SHA
docker push hd719/complex-server:$SHA
docker push hd719/complex-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=hd719/complex-server:SHA
kubectl set image deployments/client-deployment client=hd719/complex-client:SHA
kubectl set image deployments/worker-deployment worker=hd719/complex-worker:SHA