provider "aws" {
  region = "us-east-1" # Adjust the region as needed
}

resource "aws_eks_cluster" "eks_cluster" {
  name     = "eks-cluster"
  role_arn = "arn:aws:iam::759984737373:role/ccm-sam-eks"

  vpc_config {
    subnet_ids = [
      "subnet-075ac06f814233f40",
      "subnet-089e7a40da26dd845",
      "subnet-0d3650898e5d4ca9a",
      "subnet-03f25ce1cd0535df9",
    ]
  }
}

resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "eks-node-group"
  node_role_arn   = "arn:aws:iam::759984737373:role/AmazonEKSNodeRoleCCM"
  subnet_ids      = [
    "subnet-075ac06f814233f40",
    "subnet-089e7a40da26dd845",
    "subnet-0d3650898e5d4ca9a",
    "subnet-03f25ce1cd0535df9",
  ]

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }
}
