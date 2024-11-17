# CS4347-final-project

### SETUP
1. Download [Sports_Team_FrontEnd.zip](https://github.com/IbrahimARahman/CS4347-final-project/blob/main/Sports_Team_FrontEnd.zip)
2. Extract all files to desktop, and place the batch file and jar file on the desktop
3. Ensure the system has java installed and the system PATH for java is set up. (can test with java -version on CMD)
4. Ensure the system has posgresql setup, and the Sports_Team database has been created following the sql code on our git hub: https://github.com/IbrahimARahman/CS4347-final-project/blob/main/databaseCreation.sql
5. Ensure the posgresql server is running locally, using port 5432
4. Create a user on the database and grant all permissions to that user
5. Use the newly created user credentials to authenticate when using our front end script.


### RUNNING
1. If on windows, run the batch file by double clicking it and the program should run on the command line
2. If on Linux or MACOS
	1. Open command line
	2. navigate to desktop directory
	3. run command "java -jar frontend-1.0-SNAPSHOT.jar"
