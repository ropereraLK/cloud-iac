module "task_queue" {
  source = "../../modules/sqs"
  name   = "task-queue"
}

module "email_queue" {
  source = "../../modules/sqs"
  name   = "email-queue"
}