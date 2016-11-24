# scp ~/workspace/aleix/genzyme/_backup/20161124-genzyme-backup-dev.tar.gz postersgenzyme@ps63196.dreamhost.com:~/posters.macrofonoestudio.es/_backup/incoming
# scp ~/diego/bin/genzyme_backup_production.sh postersgenzyme@ps63196.dreamhost.com:~/bin
# mkdir $APP_BACKUP_ROUTE_INCOMING/deploy $APP_BACKUP_ROUTE_INCOMING/deploy/$DATE
# touch ~/posters.macrofono.es/tmp/restart.txt

echo 'DJANGO APP BACKUP MANAGEMENT'
echo $0 $1

case "$1" in

	"pro-backup-deploy")
		DATE=`TZ=GMT-8 date +%Y%m%d`
		DEPLOY_PATH=~/posters.macrofono.es/_backup/production/deploy
		FILE_TO_DEPLOY=~/posters.macrofono.es/_backup/production/20161124-genzyme-backup-pro.tar.gz
		mkdir $DEPLOY_PATH
		mkdir $DEPLOY_PATH/$DATE
		echo $DATE
		echo 'DEPLOY_PATH    :: '$DEPLOY_PATH
		echo '$DEPLOY_PATH/$DATE :: '$DEPLOY_PATH/$DATE
		echo 'FILE_TO_DEPLOY :: '$FILE_TO_DEPLOY
		echo 'DEPLOY_PATH    :: '$DEPLOY_PATH

		tar -zxf $FILE_TO_DEPLOY -C $DEPLOY_PATH/$DATE
		;;
		;;

	"pro-INSTALL")
	    ##### DESCOMPRIMIR EN LOCAL
		DATE=`TZ=GMT-8 date +%Y%m%d`
		DEPLOY_PATH=~/posters.macrofono.es/genzyme
		FILE_TO_DEPLOY=~/posters.macrofono.es/_backup/incoming/$DATE-genzyme-backup-dev.tar.gz
		
		# tar -zxf $FILE_TO_DEPLOY -C $DEPLOY_PATH
		echo 'tar -zxf '$FILE_TO_DEPLOY' -C '$DEPLOY_PATH
		
		echo '### INSTALLATION EXECUTED'
		echo '    '$FILE_TO_DEPLOY
		echo '    '$DEPLOY_PATH

		# DEPLOY_PATH=~/posters.macrofono.es/_backup/production/deploy
		# FILE_TO_DEPLOY=~/posters.macrofono.es/_backup/production/20161124-genzyme-backup-pro.tar.gz
		# mkdir $DEPLOY_PATH
		# mkdir $DEPLOY_PATH/$DATE
		# echo $DATE
		# echo 'DEPLOY_PATH    :: '$DEPLOY_PATH
		# echo '$DEPLOY_PATH/$DATE :: '$DEPLOY_PATH/$DATE
		# echo 'FILE_TO_DEPLOY :: '$FILE_TO_DEPLOY
		# echo 'DEPLOY_PATH    :: '$DEPLOY_PATH

		# tar -zxf $FILE_TO_DEPLOY -C $DEPLOY_PATH/$DATE

		# ENV=pro
		# DATE=`TZ=GMT-8 date +%Y%m%d`
		
		# APP=genzyme
		# FILE_NAME=$DATE-$APP-backup-dev.tar.gz
		# # APP_BACKUP_ROUTE_INCOMING=~/workspace/aleix/genzyme/_backup
		# APP_BACKUP_ROUTE_INCOMING=~/posters.macrofono.es/_backup/incoming

		# SOURCE_PATH=$APP_BACKUP_ROUTE_INCOMING/$FILE_NAME
		
		# DEPLOY_PATH=$APP_BACKUP_ROUTE_INCOMING/deploy/$DATE
		# DEPLOY_PATH=~/posters.macrofono.es/
		# # DEPLOY_PATH=$APP_BACKUP_ROUTE_INCOMING/deploy/$DATE

		# mkdir $APP_BACKUP_ROUTE_INCOMING/deploy $APP_BACKUP_ROUTE_INCOMING/deploy/$DATE

		# tar -zxf $SOURCE_PATH -C $DEPLOY_PATH

	    ;;


	"pro-backup")
	    ##### BACKUP LOCAL en $APP/_backup
		ENV=dev
		APP_ROUTE=~/posters.macrofono.es/genzyme
		APP_BACKUP_ROUTE=~/posters.macrofono.es/_backup/production

		# DATE=`date +'%Y%m%d'`
		DATE=`TZ=GMT-8 date +%Y%m%d`
		FILE_NAME=$DATE-genzyme-backup-pro.tar.gz

		tar -zcf $APP_BACKUP_ROUTE/$FILE_NAME -C $APP_ROUTE .

		echo '### BACKUP COMPLETED :: '$APP_BACKUP_ROUTE/$FILE_NAME
		echo '    '$APP_ROUTE
		echo '    '$APP_BACKUP_ROUTE/$FILE_NAME
		ls $APP_BACKUP_ROUTE
	    ;;

	*)
	    echo "You have failed to specify what to do correctly."
    	exit -1
    	;;

esac
	  
	 #  "dev-backup")
	 #    ##### BACKUP LOCAL en $APP/_backup
		# ENV=dev
		# APP_ROUTE=~/workspace/aleix/genzyme/app
		# APP_BACKUP_ROUTE_INCOMING=~/workspace/aleix/genzyme/_backup

		# DATE=`date +'%Y%m%d'`
		# FILE_NAME=$DATE-genzyme-backup-$ENV.tar.gz

		# tar -zcf $APP_BACKUP_ROUTE_INCOMING/$FILE_NAME -C $APP_ROUTE .

		# echo '### BACKUP COMPLETED :: '$APP_BACKUP_ROUTE_INCOMING/$FILE_NAME
		# echo '    '$APP_ROUTE
		# echo '    '$APP_BACKUP_ROUTE_INCOMING/$FILE_NAME
	 #    ;;

	  

	 #  "dev-uncompress")
	 #    ##### DESCOMPRIMIR EN LOCAL
		# ENV=dev
		# DATE=`date +'%Y%m%d'`
		# APP=genzyme
		# FILE_NAME=$DATE-$APP-backup-$ENV.tar.gz
		# APP_BACKUP_ROUTE_INCOMING=~/workspace/aleix/genzyme/_backup

		# SOURCE_PATH=$APP_BACKUP_ROUTE_INCOMING/$FILE_NAME
		# DEPLOY_PATH=$APP_BACKUP_ROUTE_INCOMING/deploy/$DATE

		# mkdir $APP_BACKUP_ROUTE_INCOMING/deploy $APP_BACKUP_ROUTE_INCOMING/deploy/$DATE

		# tar -zxf $SOURCE_PATH -C $DEPLOY_PATH

		# echo '### BACKUP UNCOMPRESSED'
		# echo '    '$SOURCE_PATH
		# echo '    '$DEPLOY_PATH
	 #    ;;



