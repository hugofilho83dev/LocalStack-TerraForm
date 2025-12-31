# LocalStack + Terraform

Projeto para provisionar infraestrutura AWS local usando **Terraform** e **LocalStack**, sem necessidade de conta AWS real.

## O que é incluído

- **S3**: Bucket para armazenamento de objetos
- **SQS**: Fila de mensagens com Dead Letter Queue (DLQ)
- **Docker**: Ambiente isolado com LocalStack

## Serviços Free Disponíveis

O LocalStack fornece os seguintes serviços AWS locais (sem custo) esses são alguns serviços que estão disponíveis:

- S3
- DynamoDB
- SQS
- SNS
- Lambda
- SSM
- Events
- CloudWatch Logs
- Kinesis
- API Gateway
- ACM
- Route 53
- Step Functions


## Pré-requisitos

- Docker e Docker Compose
- Terraform

## Como usar

1. Inicie o LocalStack:
```bash
docker-compose up -d
```

2. Inicialize o Terraform:
```bash
terraform init
```

3. Aplique a configuração:
```bash
terraform apply
```

4. Consulte as saídas (URLs e ARNs das filas):
```bash
terraform output
```

## Parar o ambiente

```bash
docker-compose down
```

## Endpoints

- LocalStack: `http://localhost:4566`
- Credenciais: `test` / `test`
