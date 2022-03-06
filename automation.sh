#!bin/Bash
sudo apt-get update
sudo apt install apache2
systemctl start apache2
systemctl enable apache2
sudo service apache2 status

#Tar FIle
timestamp=$(date '+%d%M%Y-%H%M%S')
tar_File_name=Preethi-httpd-logs-$timestamp.tar
tar -cvf /tmp/$tar_File_name  /var/log/apache2/access.log

#Installing AWSCLI
sudo apt install awscli

#aws configure  is hidden due to security purposee)

#Creating s3Bucket
name=upgrad-preethi961
aws s3 mb s3://${name}


#copying a tar file from ec2Instance to s3 bucket
aws s3 cp  /tmp/$tar_File_name s3://${name}/$tar_File_name

#Listing bucketname and files in bucket
aws s3 ls
aws s3 ls s3://$name
