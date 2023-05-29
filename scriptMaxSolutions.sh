#!/bin/bash

PURPLE='0;35'
NC='\033[0m' 
VERSAO=11
	
echo  "$(tput setaf 10)[MaxS assistant]:$(tput setaf 7)  Olá Usuário! Sou MaxS e serei seu assistente para instalação da aplicação Max Solutions!;"
echo  "$(tput setaf 10)[MaxS assistant]:$(tput setaf 7)  Verificando aqui se você possui o Java instalado...;"
sleep 2

java -version
if [ $? -eq 0 ]	
	then
		echo "$(tput setaf 10)[Maxs assistant]:$(tput setaf 7) : Você já possui o java instalado!!!"
		if [ $VERSAO -ne 17 ]
				then
					echo "$(tput setaf 10)[MaxS assistant]:$(tput setaf 7) Preparando a atualização para a versão 17 do Java."
					sudo apt install default-jre ; apt install openjdk-17-jre-headless; -y
					clear
					echo "$(tput setaf 10)[MaxS assistant]:$(tput setaf 7) Java instalado com sucesso!"

					echo "$(tput setaf 10)[MaxS assistant]:$(tput setaf 7) Com o Java instalado, já podemos instalar nossa aplicação na sua máquina."
					echo "$(tput setaf 10)[MaxS assistent]:$(tput setaf 7) Você gostaria de instalar nossa aplicação (S/N)?"
					read inst
					if [ \"$inst\" == \"S\" ]
						then
							git clone https://github.com/Grupo02-Sprint/looca-api-max-solutions.git
							cd looca-api-maxsolutions/
							cd tentativa-looca-api/
							cd target/
							java -jar looca-api-java-1.0-SNAPSHOT-jar-with-dependencies.jar
					fi
				fi
		else
			echo "$(tput setaf 10)[MaxS assistant]:$(tput setaf 7)  Opa! Não identifiquei nenhuma versão do Java instalado, mas sem problemas, irei resolver isso agora!"
			echo "$(tput setaf 10)[Maxs assistant]:$(tput setaf 7)  Confirme para mim se realmente deseja instalar o Java na versão 17 (S/N)?"
			read inst
	if [ \"$inst\" == \"S\" ]
		then
			echo "$(tput setaf 10)[MaxS assistant]:$(tput setaf 7)  Ok! Você escolheu instalar o Java ;D"
			echo "$(tput setaf 10)[MaxS assistant]:$(tput setaf 7)  Adicionando o repositório!"
			sleep 2
			sudo add-apt-repository ppa:webupd8team/java -y
			clear
			echo "$(tput setaf 10)[MaxS assistant]:$(tput setaf 7)  Atualizando! Quase lá."
			sleep 2
			sudo apt update && sudo apt upgrade -y
			clear
			
			if [ $VERSAO -ne 17 ]
				then
					echo "$(tput setaf 10)[MaxS assistant]:$(tput setaf 7) Preparando para instalar a versão 17 do Java."
					sudo apt install default-jre ; apt install openjdk-17-jre-headless; -y
					clear
					echo "$(tput setaf 10)[MaxS assistant]:$(tput setaf 7) Java instalado com sucesso!"

					echo "$(tput setaf 10)[MaxS assistant]:$(tput setaf 7) Com o Java instalado, já podemos instalar nossa aplicação na sua máquina."
					echo "$(tput setaf 10)[MaxS assistent]:$(tput setaf 7) Você gostaria de instalar nossa aplicação (S/N)?"
					read inst
					if [ \"$inst\" == \"S\" ]
						then
							git clone https://github.com/Grupo02-Sprint/looca-api-max-solutions.git
							cd looca-api-maxsolutions/
							cd tentativa-looca-api/
							cd target/
							java -jar looca-api-java-1.0-SNAPSHOT-jar-with-dependencies.jar
					fi
			fi
	else	
		echo "$(tput setaf 10)[MaxS assistant]:$(tput setaf 7)  Você optou por não instalar o Java por enquanto, até a próxima então!"
	fi
fi
