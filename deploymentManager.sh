NC='\033[0m' # No Color
RED='\033[0;31m'
echo "Hello there !, im your API deployment manager"
echo
echo "please tell me the container id you want me to assist"
echo
read container_id
if [ $(docker inspect --format='{{ .State.Status }}' $container_id) = "running" ];
     then 
     echo -e "Container status: ${Green}Running${NC}";
     echo "Tell me the folders you want to deploy"
     printf "\n"

      while true; do
      echo
      echo "On which topic do you want advice?"
       echo "1.   Configuration"
       echo "2.   Models"
       echo "3.   Public"
       echo "4.   routes-> authorize"
       echo "5.   routes-> Unauthorize"
       echo "6.   routes-> functions"
       echo "7.   routes-> index.js"
       echo "8.   routes-> users.js"
       echo "9.   URL"
       echo "10.  utils"
       echo "11.  views"
       echo "12.  server.js"
       echo "13.  bin"
       echo "14.  node-modules"
       echo ""
       echo "0.   exit"
       echo "100. restart container"
      echo
      
      echo -n "Enter your choice, or 0 for exit: "
      read choice
      echo
      
      case $choice in
           1)
           docker cp ~/$container_id/configuration/. $container_id:/home/aof_api/configuration/
           echo -ne "${RED}1.  Configuration deployed ${NC}"
           printf "\n"
           sleep 1
           ;;
           2)
           docker cp ~/$container_id/models/. $container_id:/home/aof_api/models/ 
           echo -ne "${RED}"2.  Models deployed" ${NC}"
           printf "\n"
           sleep 1
           ;;
           3)
           docker cp ~/$container_id/public/. ac69:/home/aof_api/public/
           echo -ne "${RED}"2.  public deployed" ${NC}"
           echo "3.  Public"
           printf "\n"
           sleep 1
           ;;
           4)
           docker cp ~/$container_id/routes/authorize/. $container_id:/home/aof_api/routes/authorize/
           #echo "4.  routes-> authorize"
           echo -ne "${RED}"4.  routes-> authorize deployed" ${NC}"
           printf "\n"
           sleep 1
           ;;
           5)
           docker cp ~/$container_id/routes/unauthorize/. $container_id:/home/aof_api/routes/unauthorize/
           echo -ne "${RED}"5.  routes-> Unauthorize deployed" ${NC}"
           printf "\n"
           sleep 1
           ;;
           6)
           docker cp ~/$container_id/routes/functions/. $container_id:/home/aof_api/routes/functions/
           echo -ne "${RED}"6.  routes-> functions deployed" ${NC}"
           printf "\n"
           sleep 1
           ;;
           7)
           docker cp ~/$container_id/routes/index.js $container_id:/home/aof_api/routes/
           echo -ne "${RED}"7.  routes-> index.js deployed" ${NC}"
           echo "7.  routes-> index.js"
           printf "\n"
           sleep 1
           ;;
           8)
           docker cp ~/$container_id/routes/users.js $container_id:/home/aof_api/routes/
           echo -ne "${RED}"8.  routes-> users.js deployed" ${NC}"
           echo "8.  routes-> users.js"
           printf "\n"
           sleep 1
           ;;
           9)
           docker cp ~/$container_id/URL/. $container_id:/home/aof_api/URL/
           echo -ne "${RED}"9.  URL deployed" ${NC}"
           echo "9.  URL"
           printf "\n"
           sleep 1
           ;;
           10)
           docker cp ~/$container_id/utils/. $container_id:/home/aof_api/routes/utils/
           echo -ne "${RED}"10. utils" ${NC}"
           echo "10. utils"
           printf "\n"
           sleep 1
           ;;
           11)
           docker cp ~/$container_id/views/. $container_id:/home/aof_api/routes/views/
           echo -ne "${RED}"11. views deployed" ${NC}"
           echo "11. views"
           printf "\n"
           sleep 1
           ;;
           12)
           docker cp ~/$container_id/server.js $container_id:/home/aof_api/
           echo -ne "${RED}"12. server.js deployed" ${NC}"
           printf "\n"
           sleep 1
           ;;
           13)
           docker cp ~/$container_id/bin/. $container_id:/home/aof_api/bin/
           echo -ne "${RED}"13. bin deployed" ${NC}"
           printf "\n"
           sleep 1
           ;;
           14)
           docker cp ~/$container_id/node_modules/. $container_id:/home/aof_api/node_modules/
           echo -ne "${RED}"14. node modules deployed" ${NC}"
           printf "\n"
           sleep 1
           ;;
           100)
           echo "Restarting $container_id"
           docker restart $container_id
           echo -ne "${RED}"DONE" ${NC}"
           printf "\n"
           sleep 1
           ;;
           0)
           echo "OK, see you!"
           printf "\n"
           break
           ;;
           *)
           echo "That is not a valid choice."
           printf "\n"
           sleep 1
           ;;
      esac  
      done
else 
     echo "stopped" #Container status: ${Red}Stopped${NC};
fi
