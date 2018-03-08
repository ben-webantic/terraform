/**
 * ELB Resource 
 */ 

resource "aws_elb" "elb" {
  name               = "${var.elb_name}"
  availability_zones = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  
  listener {
    instance_port      = 80
    instance_protocol  = "http"
    lb_port            = 80
    lb_protocol        = "http"
  }

  connection_draining         = true
  connection_draining_timeout = 400
}