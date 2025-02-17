start:
	java -Xms512M -Xmx512M -jar server.jar --nogui

ngrok:
	ngrok tcp 25565

ssh:
	ssh -i "key-skibidilandia.pem" ec2-user@ec2-18-226-248-126.us-east-2.compute.amazonaws.com

worlds:
	rm -rf world world_nether world_the_end skibidilandia_world
	git clone git@github.com:jlenon7/skibidilandia_world.git
	cp -r skibidilandia_world/world ./world
	cp -r skibidilandia_world/world_nether ./world_nether
	cp -r skibidilandia_world/world_the_end ./world_the_end

