# Creating a Production Ready AWS Network
# Setup remote state
<p>Run the backend.tf in the remote state folder to set up an S3 bucket and DynamoDB table for the remote state. The remote state must be initialised before running the terraform files in the root directory.</p>

# backend.tf 
<p>Creates the S3 bucket for storing the remote state and the DynamoDB for locking the state. Changes the backend to S3 so that the state is stored remotely.</p>
<p></p>
<p>To use:</p>
<p>- Change the region in the backend block to match region in providers.tf</p>
<p>- Change the name of the bucket and the DB in both the backend block and for the individual resources</p>
<p>- Run terraform apply to create the S3 bucket and the DynamoDB table</p>
<p>- Run terraform init to change the backend to S3 and store the state in the bucket</p>

# VPC module

<p>Creates a new vpc with the specified name and cidr range. Creates 2 subnets, 1 public and 1 private, in each of the specified availability zones. Creates </p>an internet gateway and attaches it to the vpc. Creates 1 public route table for all of the public subnets and a route table for each of the private subnets.

### To use:
<p>- Create a module block and set the source as this VPC module</p>

### Variables:
<p>vpc_name - the name that will be used for all resources created by the vpc (string)</p>
<p>vpc_cidr_block - the cidr range that the vpc will use (string)</p>
<p>subnet_azs - list of subnet availability zones to create the subnets in (list(string))</p>
<p>public_subnet_cidr - list of cidr ranges for the public subnets (list(string))</p>
<p>private_subnet_cidr - list of cidr ranges for the private subnets (list(string))</p>
<p>managed_by - tag added to each resource to label who manages it (string)</p>

# Security group module
<p>Creates a new security group for the specified VPC with the passed name. Allows you to choose to create a rule for allowing all outbound traffic from the </p>VPC, a rule for allowing http, and https connections from all IPs, and a rule to allow SSH from a specified CIDR range.

### Variables:
<p>sg_name - the same of the new security group (string)</p>
<p>vpc_id - id of the VPC the security group will be attached to (string)</p>
<p>description - a description of the security group (string)</p>
<p>allow_outbound - bool to create a rule allowing all outbound traffic (bool)</p>
<p>allow_http - bool  to create a rule allowing inbound traffic on ports 80 and 443 for all IP addresses (bool)</p>
<p>allow_ssh - bool to create a rule allowing ssh connections on port 22 for a specified cidr range(bool)</p>
<p>ssh_cidr - string containing CIDR range to allow ssh connections from, null by default, must be set if allow_ssh is true (string)</p>
<p>managed_by - tag added to the security group to label who manages it (string) </p>

### Optional variables:
<p>http_port - port to allow http connections on, default 80 (number)</p>
<p>https_port - port to allow https connections on, default 443 (number)</p>
<p>ssh_port - port toa allow ssh connections on, default 22 (number)</p>
<p>http_ipv4_cidr - CIDR range to allow http/https connections from, default 0.0.0.0/0 (string)</p>

# EC2 module
<p>Creates a new EC2 instance in each of the specified subnets. Allows you to choose the type of instance, whether to associate a public IP, the AMI, the subbnets to create instances in, the security group of instances and a key pair to use when connecting to the instnaces.</p>

### To use:
<p>Using the AWS CLI, create a new key pair to use for the key_name vairable, add this key to the .gitignore file</p>

### Variables:
<p>instance_name - name to use for the created instances (string)</p>
<p>ami - ID of an AMI to use on the instances (string)</p>
<p>instance_type - type of instance to provision (string)</p>
<p>associate_public_ip - bool whether to assign a public IP to the instances (bool)</p>
<p>subnet_ids - list of subnet IDs to provision instances in, the module provisions 1 instance per subnet (list(string))</p>
<p>security_group_ids - list of security groups to give to the instances (list(string))</p>
<p>key_name - name of the key pair to use for the instances, use aws cli to create a new key pair and set this variable as the name of that new key (string)</p>
<p>managed_by - tag added to the security group to label who manages it (string)  </p>

### Creating an AMI image
<p>- Launch an EC2 instance using amazons ubuntu AMI and SSH into it.</p>
<p>- Run sudo apt update, then sudo apt install nginx</p>
<p>- Configure Nginx to show your website</p>
<p>- In the aws console select the instance that you have configured and then create image</p>
<p>- Use the AMI id of this image for the ami variable in the EC2 module and all your instances should be hosting the same webpage using Nginx</p>

# Load balancer module
<p>Creates a load balanacer for the specified subnets, a target group attached to the vpc the subnets are in, attaches instances to the target group, and creates a listener for the load balancer.</p>

### Variables
<p>lb_name - Name for the load balancer (string)</p>
<p>internal - Bool whether the load balancer is internal, default is false (bool)</p>
<p>lb_type -  The type of load balancer (string)</p>
<p>security_group_ids - List of the security groups for the load balancer (list(string))</p>
<p>subnet_ids - List of subnet IDs to attach to the load_balancer (list(string))</p>
<p>ip_type - Type of IP addresses used by the subnets for the load balancer, default is ipv4 (string)</p>
<p>lb_port - Port on which the targets recieve traffic (number)</p>
<p>lb_protocol - Protocol to use for routing traffic to the targets (string)</p>
<p>vpc_id - ID of the vpc to create the target group in (string)</p>
<p>instance_ids - List of instance IDs to attach to the target group (list(string))</p>
<p>listener_action_type - Type of the default routing action of the listener (string)</p>
<p>managed_by - Tag added to the security group to label who manages it (string)</p> 

# Auto scaling group module
<p>Creates an auto scaling group in the specified subnets and adds them to an existing load balancer. Will either create a new launch template to create instances from or allows a prexisting launch template to be used.</p>

### Variables
<p>asg_name - Name of the auto scaling group (string)</p>
<p>max_size - Maximum size of the auto scaling group (number)</p>
<p>min_size - Minimum size of the auto scaling group (number)</p>
<p>desired_size - Desired size of the auto scaling group (number)</p>
<p>subnet_ids - List of subnet IDs to the auto scaling group will provision instances in (list(string))</p>
<p>target_group_arns - List of target group ARNs to attach the instances to for load balancing (list(string))</p>
<p>health_check_type - type of health check to use, EC2 or ELB (string)</p>
<p>health_check_grace_period - Time in seconds after instnce comes into service before checking health, required if health check type is ELB, default is 300 (number)</p>
<p>launch_template_name - Name for new launch template (string)</p>
<p>launch_template_version - Version of the launch template to use, can be the version number or $Latest or $Default (string)</p>
<p>launch_template_ami - AMI to use for the launch template (string)</p>
<p>key_name - Name of key pair to use for connecting to the instances (string)</p>
<p>instance_type - Type of instance to use in the launch template, default is t2.micro (string)</p>
<p>security_group_ids - List of security group IDs to add to the instances (list(string))</p>
<p>launch_template_user_data - Path to a user data file to use when creating instances, must be in plain text, default is null (string)</p>
<p>launch_template_id - ID of preexisting launch template to use, overwrites creating a new launch template (string)</p>
<p>managed_by - Tag added to the security group to label who manages it (string)</p>