# 1. நமக்கான சொந்த பிரைவேட் நெட்வொர்க் (VPC) உருவாக்குறோம்
resource "aws_vpc" "vision_flow_vpc" {
  cidr_block           = "10.0.0.0/16" # இது நம்ம நெட்வொர்க்கோட ஐபி அட்ரஸ் ரேஞ்ச் மச்சா
  enable_dns_hostnames = true

  tags = {
    Name = "Vision-Flow-VPC"
  }
}

# 2. இன்டர்நெட் கனெக்ஷனுக்காக மெயின் கேட் (Internet Gateway) வைக்கிறோம்
resource "aws_internet_gateway" "vision_flow_igw" {
  vpc_id = aws_vpc.vision_flow_vpc.id

  tags = {
    Name = "Vision-Flow-IGW"
  }
}

# 3. நம்ம சர்வர் உட்காரப்போற பப்ளிக் ஏரியா (Public Subnet)
resource "aws_subnet" "vision_flow_public_subnet" {
  vpc_id                  = aws_vpc.vision_flow_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true # சர்வர் ஆன் ஆகும்போது ஆட்டோமேட்டிக்கா ஐபி அட்ரஸ் கிடைச்சிரும்

  tags = {
    Name = "Vision-Flow-Public-Subnet"
  }
}