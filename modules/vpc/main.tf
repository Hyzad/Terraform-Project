resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name      = var.vpc_name
    ManagedBy = var.managed_by
  }
}

resource "aws_subnet" "private" {
  count             = length(var.subnet_azs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr[count.index]
  availability_zone = var.subnet_azs[count.index]

  tags = {
    Name      = "${var.vpc_name}-private-${count.index + 1}"
    ManagedBy = var.managed_by
  }
}

resource "aws_subnet" "public" {
  count             = length(var.subnet_azs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_cidr[count.index]
  availability_zone = var.subnet_azs[count.index]

  tags = {
    Name      = "${var.vpc_name}-public-${count.index + 1}"
    ManagedBy = var.managed_by
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name      = "${var.vpc_name}-igw"
    ManagedBy = var.managed_by
  }
}

resource "aws_route_table" "private" {
  count  = length(aws_subnet.private)
  vpc_id = aws_vpc.main.id

  tags = {
    Name      = "${var.vpc_name}-private-route-table-${count.index + 1}"
    ManagedBy = var.managed_by
  }
}

resource "aws_route_table_association" "private" {
  count          = length(aws_subnet.private)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[count.index].id
}


resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name      = "${var.vpc_name}-public-route-table"
    ManagedBy = var.managed_by
  }
}

resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}
