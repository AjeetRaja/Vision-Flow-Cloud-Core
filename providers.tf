terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1" # இத அப்படியே வை, அப்புறம் மாத்திக்கலாம்
}