resource "aws_sqs_queue" "test_queue_dlq" {
  name                      = "my-test-queue-dlq"
  delay_seconds             = 0
  max_message_size          = 262144
  message_retention_seconds = 1209600

  tags = {
    Environment = "dev"
  }
}

resource "aws_sqs_queue" "test_queue" {
  name                      = "my-test-queue"
  delay_seconds             = 0
  max_message_size          = 262144
  message_retention_seconds = 345600
  receive_wait_time_seconds = 0
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.test_queue_dlq.arn
    maxReceiveCount     = 4
  })

  tags = {
    Environment = "dev"
  }
}

output "sqs_queue_url" {
  value       = aws_sqs_queue.test_queue.url
  description = "URL da fila SQS"
}

output "sqs_queue_arn" {
  value       = aws_sqs_queue.test_queue.arn
  description = "ARN da fila SQS"
}

output "sqs_queue_dlq_url" {
  value       = aws_sqs_queue.test_queue_dlq.url
  description = "URL da fila DLQ"
}

output "sqs_queue_dlq_arn" {
  value       = aws_sqs_queue.test_queue_dlq.arn
  description = "ARN da fila DLQ"
}
