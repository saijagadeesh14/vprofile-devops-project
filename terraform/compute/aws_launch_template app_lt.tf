resource "aws_launch_template" "app_lt" {
  name_prefix   = "vprofile-lt-"
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"
  key_name = "vprofile_keypair"

  vpc_security_group_ids = [aws_security_group.app_sg.id]

  user_data = base64encode(file("app.sh"))

  update_default_version = true

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "vprofile-app"
    }
  }
}