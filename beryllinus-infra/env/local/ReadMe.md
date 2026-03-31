docker run -d \
  -p 4566:4566 \
  -e SERVICES=sqs \
  -e DEBUG=1 \
  -e LOCALSTACK_ACKNOWLEDGE_ACCOUNT_REQUIREMENT=1 \
  --name localstack \
  localstack/localstack