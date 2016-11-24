# echo $1
# echo $2
# echo $3
# echo $4
# echo $5
echo 'DJANGO APP BACKUP MANAGEMENT'
echo $0 $1

case "$1" in
  
  "dev-backup")
    ##### BACKUP LOCAL en $APP/_backup
	ENV=dev
	APP_ROUTE=~/workspace/aleix/genzyme/app
	APP_BACKUP_ROUTE=~/workspace/aleix/genzyme/_backup

	DATE=`date +'%Y%m%d'`
	FILE_NAME=$DATE-genzyme-backup-$ENV.tar.gz

	tar -zcf $APP_BACKUP_ROUTE/$FILE_NAME -C $APP_ROUTE .

	echo '### BACKUP COMPLETED :: '$APP_BACKUP_ROUTE/$FILE_NAME
	echo '    '$APP_ROUTE
	echo '    '$APP_BACKUP_ROUTE/$FILE_NAME
    ;;

  

  "dev-uncompress")
    ##### DESCOMPRIMIR EN LOCAL
	ENV=dev
	DATE=`date +'%Y%m%d'`
	APP=genzyme
	FILE_NAME=$DATE-$APP-backup-$ENV.tar.gz
	APP_BACKUP_ROUTE=~/workspace/aleix/genzyme/_backup

	SOURCE_PATH=$APP_BACKUP_ROUTE/$FILE_NAME
	DEPLOY_PATH=$APP_BACKUP_ROUTE/deploy/$DATE

	mkdir $APP_BACKUP_ROUTE/deploy $APP_BACKUP_ROUTE/deploy/$DATE

	tar -zxf $SOURCE_PATH -C $DEPLOY_PATH

	echo '### BACKUP UNCOMPRESSED'
	echo '    '$SOURCE_PATH
	echo '    '$DEPLOY_PATH
    ;;



  "pro-backup")
    ##### DESCOMPRIMIR EN LOCAL
	ENV=dev

	DATE=TZ=GMT-8 date +%Y%m%d
	date +%m-%d-%Y -d "$DATE + 1 day"

	APP=genzyme
	FILE_NAME=$DATE-$APP-backup-$ENV.tar.gz
	APP_BACKUP_ROUTE=~/workspace/aleix/genzyme/_backup

	SOURCE_PATH=$APP_BACKUP_ROUTE/$FILE_NAME
	DEPLOY_PATH=$APP_BACKUP_ROUTE/deploy/$DATE

	mkdir $APP_BACKUP_ROUTE/deploy $APP_BACKUP_ROUTE/deploy/$DATE

	tar -zxf $SOURCE_PATH -C $DEPLOY_PATH

	echo '### BACKUP UNCOMPRESSED'
	echo '    '$SOURCE_PATH
	echo '    '$DEPLOY_PATH
    ;;



  *)
    echo "You have failed to specify what to do correctly."
    exit -1
    ;;
esac