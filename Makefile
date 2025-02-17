start:
	java -Xms4G -Xmx4G -jar server.jar --nogui

ngrok:
	ngrok tcp 25565

ssh:
	ssh -i "key-skibidilandia.pem" ec2-user@ec2-18-226-248-126.us-east-2.compute.amazonaws.com

