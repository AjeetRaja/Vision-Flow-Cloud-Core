# 1. சர்வருக்கான செக்யூரிட்டி கார்ட் (Security Group)
resource "aws_security_group" "vision_flow_sg" {
  name        = "vision-flow-sg"
  description = "Allow inbound traffic for AI Core"
  vpc_id      = aws_vpc.vision_flow_vpc.id

  # SSH Access (நம்ம லேப்டாப்ல இருந்து சர்வரை கண்ட்ரோல் பண்ண)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # FastAPI Web HTTP Port (நம்ம AI கேமரா டேட்டா அனுப்பும் போர்ட்)
  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound Rules (சர்வர் வெளில இருக்குற இன்டர்நெட்டை கனெக்ட் பண்ண)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Vision-Flow-SG"
  }
}

# 2. நம்ம உபுண்டு சர்வர் (EC2 Instance)
resource "aws_instance" "vision_flow_server" {
  ami           = "ami-0c7217cdde317cfec" # Ubuntu 22.04 LTS AMI ID (us-east-1)
  instance_type = "t2.micro"             # நம்ம பிராக்டிஸ் பண்றதுக்கு இது ஃப்ரீ டயர் மச்சா!

  subnet_id              = aws_subnet.vision_flow_public_subnet.id
  vpc_security_group_ids = [aws_security_group.vision_flow_sg.id]

  tags = {
    Name = "Vision-Flow-AI-Compute"
  }
}