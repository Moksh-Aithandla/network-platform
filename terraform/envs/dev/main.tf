data "aws_availability_zones" "available" {
  state = "available"
}
module "edge_vpc" {
  source = "../../modules/vpc"

  name               = "network-platform-edge"
  cidr_block         = "10.10.0.0/16"
  environment        = "dev"
  availability_zones = slice(data.aws_availability_zones.available.names, 0, 2)
}
