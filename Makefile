start:
	java -Xms2G -Xmx2G -jar server.jar --nogui

ngrok:
	ngrok tcp --region=sa --remote-addr=1.tcp.sa.ngrok.io:20697 25565

ssh:
	ssh -i "key-skibidilandia.pem" ubuntu@ec2-15-229-22-159.sa-east-1.compute.amazonaws.com

worlds:
	rm -rf world world_nether world_the_end skibidilandia_world
	git clone git@github.com:jlenon7/skibidilandia_world.git
	cp -r skibidilandia_world/world ./world
	cp -r skibidilandia_world/world_nether ./world_nether
	cp -r skibidilandia_world/world_the_end ./world_the_end

update-worlds:
	rm -rf skibidilandia_world
	git clone git@github.com:jlenon7/skibidilandia_world.git
	rm -rf skibidilandia_world/world skibidilandia_world/world_nether skibidilandia_world/world_the_end
	cp -r world skibidilandia_world/world
	cp -r world_nether skibidilandia_world/world_nether
	cp -r world_the_end skibidilandia_world/world_the_end
	cd skibidilandia_world && git add -A && git commit -m "feat: server restart" && git push

restart:
	screen -S minecraft -X stuff "say Servidor será reiniciado em 5 minutos!\n"
	sleep 2
	screen -S minecraft -X stuff "say Servidor será reiniciado em 1 minuto!\n"
	sleep 1
	screen -S minecraft -X stuff "say Reiniciando servidor!\n"
	screen -S minecraft -X stuff "save-all\n"
	screen -S minecraft -X stuff "stop\n"
	sleep 10
	update-worlds
	screen-start

screen-start:
	-screen -S minecraft -X quit || true
	screen -dmS minecraft make start

screen-connect:
	screen -r minecraft


