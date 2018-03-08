/**
 * ELB Resource 
 */ 

resource "aws_elb" "elb" {
  name               = "${var.elb_name}"
  availability_zones = "${var.elb_zones}"
  
  listener {
    instance_port      = 80
    instance_protocol  = "http"
    lb_port            = 80
    lb_protocol        = "http"
  }

  connection_draining         = true
  connection_draining_timeout = 400
}