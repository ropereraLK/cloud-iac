module "task_queue" {
  source = "../../modules/sqs"
  name   = "task-queue"
  enable_dlq         = true
  visibility_timeout = 120
}

module "email_queue" {
  source = "../../modules/sqs"
  name   = "email-queue-1"
}