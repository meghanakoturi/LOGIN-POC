# DOCUMENTATION ON THREE-TIER ARCHITECTURE 
# LOGIN PAGE

# Introduction :
This project demonstrates the development of a web-based application featuring a login system with a subsequent dashboard using the three-tier architecture. Our goal is to construct a secure and intuitive platform where users can authenticate themselves and access personalized content through a centralized dashboard.

The three-tier architecture, comprising the presentation layer, application layer, and data layer, serves as the backbone of our application's design. The presentation layer encompasses user interface elements such as login forms and dashboards, while the application layer houses the business logic for user authentication and content delivery. The data layer manages the storage and retrieval of user credentials and dashboard data, ensuring robustness, security, and scalability.

This implementation leverages Eclipse as the Integrated Development Environment (IDE), with key files including index.jsp, verification.jsp, and dashboard.jsp. In verification.jsp, database details are configured, specifying the AWS instance where MySQL is hosted, along with the requisite user and database settings.

The build process involves Maven, which generates a WAR (Web Application Archive) file upon compilation. This WAR file encapsulates the entire project, including necessary dependencies and configurations. Subsequently, the WAR file is deployed to a Tomcat server for hosting and execution.

Through this project, we aim to exemplify the practical application of three-tier architecture in web development, emphasizing modularity, scalability, and maintainability. By following this architectural pattern, we ensure a structure d and extensible solution capable of meeting evolving requirements and accommodating future enhancements.

# Technologies Used:
* Java (JDK 8)
* Apache Maven
* Apache Tomcat
* JSP (JavaServer Pages)
* MySQL (hosted on AWS)


# Installing Eclipse
1.Download Eclipse:
* Visit the Eclipse Downloads page.
* Download the "Eclipse IDE for Java EE Developers" package.
2.Install Eclipse:
* Unzip the downloaded file.
* Open the unzipped folder and run the eclipse.exe (Windows) or eclipse (Mac/Linux) executable file.
* Select a workspace directory (this is where your projects will be stored).

# Setting Up Your Project in Eclipse
1. Create a New Maven Project:
* Open Eclipse.
* Go to File > New > Other....
* Select Maven > Maven Project and click Next.
* Select the default workspace location and click Next.
* Choose maven-archetype-webapp and click Next.
* Fill in the Group Id (e.g., com.example) and Artifact Id (e.g., Login), then click Finish.

# Project Directory Structure:

- Login/
- ├── src/
- |.............    └── main
- |............................├─ webapp
- |.........................................├─ WEB-INF
- |.........................................└── dashboard.jsp
- |.........................................└── dashboard2.jsp
- |.........................................├── index.jsp
- |.........................................└── verification.jsp
- ├── target
- |...............     └── Login
- |...............     └── m2e-wtp
- |...............     ├── maven-archiver
- |...............     ├── Login.war
- |...............     └── pom.xml  
- └── Servers
-  ...............     └──Tomcat v8.5 Server at localhost-config


1. Login:
* This is likely the root directory of your project.

2. src/main/resources: 
* This directory typically holds non-Java resources used by your application, such as configuration files, property files, or static resources.

3. JRE System Library [JavaSE-1.8]: 
* This represents the Java Runtime Environment (JRE) System Library, containing essential Java runtime classes. It's automatically included in your Java project by your IDE.

4. Maven Dependencies: 
* This directory contains all the dependencies managed by Maven for your project. Each JAR file represents a library required by your project, such as the servlet API (javax.servlet-api-3.1.0.jar), MySQL JDBC driver (mysql-connector-java-8.0.33.jar), and others. It's typical to see multiple JAR files listed under Maven Dependencies.

5. src/main/webapp:
* This directory contains your web application's resources, including JSP files (index.jsp, verification.jsp, dashboard.jsp, dashboard2.jsp), as well as the WEB-INF/ directory. The WEB-INF/ directory typically contains configuration files specific to your web application, such as web.xml.

6. target/Login:
* This directory seems to represent the output directory where the compiled files are generated. It includes the src/ directory, which might be a duplication.

7. target/m2e-wtp: 
* This directory might be related to the Maven Eclipse Plugin (m2e-wtp), which helps with deploying Maven projects to Eclipse's WTP (Web Tools Platform). It includes the maven-archiver/ directory, which contains the WAR file (Login.war) generated by Maven. The pom.xml file is also included here, which is the Maven project configuration file.

8. Servers/Tomcat v8.5 Server at localhost-config: 
* This directory seems to contain configuration files related to the Tomcat v8.5 Server configured on your local machine. It's likely managed by your IDE (e.g., Eclipse) to handle server configurations.

# Data Configuration:

1. EC2 instance setup:
* Launch an EC2 instance with the desired specifications (e.g., instance type, operating system).
* Ensure that the security group associated with the instance allows inbound connections on the MySQL port (default is 3306) from the necessary IP addresses or ranges.

2. MySQL Installation:
* Connect to your EC2 instance using SSH.
* Update the package repository:
```
sudo yum update
```
* Install MySQL server:
```
 sudo rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022
 wget http://dev.mysql.com/get/mysql57-community-release-el7-8.noarch.rpm
 sudo yum localinstall -y mysql57-community-release-el7-8.noarch.rpm
 sudo yum install -y mysql-community-server
```
* Start the MySQL service and enable it to start on boot:
```
 sudo systemctl start mysqld
 sudo systemctl enable mysqld
```

3. MySQL Configuration:
* Retrieve the root password:
```
 sudo grep 'temporary password' /var/log/mysqld.log
```
* Log in to MYSQL:
```
 mysql -u root -p
```
* Change the root password:
```
  ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'MyNewPass1!';
```
* Create a new database for your application:
```
  CREATE DATABASE loginapp;
  USE loginapp;
```
* Create tables:
```
  CREATE TABLE login (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  password VARCHAR(255) NOT NULL
  );
```
```
   CREATE TABLE user (
   id INT AUTO_INCREMENT PRIMARY KEY,
   username VARCHAR(50) NOT NULL,
   password VARCHAR(255) NOT NULL
   );
```
* Insert data into the created tables:
```
  INSERT INTO login (username, password)
  VALUES ('meghana', 'meghana123');
```
```
  INSERT INTO users (username, password)
  VALUES ('localhost', 'Localhost@123');
```
4. User Setup:
* Create a new MySQL user and grant appropriate privileges on the database:
```
   CREATE USER 'db_user'@'tomcatpublicipaddress' IDENTIFIED BY 'Apple@3005';
   GRANT ALL PRIVILEGES ON loginapp.* TO 'db_user'@'tomcatpublicipaddress';
   FLUSH PRIVILEGES;
```
Here localhost is the other instance I'd where we deploy the war file

# Implementation:

* Login System Overview:
  1. The login system involves a user entering their credentials (e.g., username and password) into a form.
  2. These credentials are then verified against the user data stored in a MySQL database running on your EC2 instance.
  3. If the credentials are valid, the user is granted access to the dashboard or another secure area of the application. Otherwise, an 
     error message is displayed.
The flow from the JSP pages (index.jsp, verification.jsp, dashboard.jsp) remains the same, but the backend code in verification.jsp would connect to your MySQL database running on your EC2 instance to perform the authentication.
In the verfication.jsp file we are mentioning the localhost means the msql instance I'd and the user which we created
` Connection con = DriverManager.getConnection("jdbc:mysql://mysqlinstancepublicipaddress:3306/loginapp?serverTimezone=UTC", "db_user", "Apple@123");`

# Build Process:

* Configure Maven Build:
  1.Right-click on your Maven project in the Project Explorer.
  2.Navigate to "Run As" > "Run Configurations...".
  3.In the "Run Configurations" dialog, expand "Maven Build" and select your Maven build configuration.
* Set Goals:
  1.In the "Goals" field, enter clean install (or any other goals you want to execute during the build process). Apply,Run.
Now, when you right-click on your Maven project and select "Run As" > "Maven Build", Eclipse will execute the specified goals (clean install) and generate the WAR file in the specified output directory. With the path search for the war file in your local machine.
Path of the war file
`C:\Users\Meghana\.m2\repository\com\jsp\Login\0.0.1-SNAPSHOT\Login-0.0.1-SNAPSHOT.war`

# Deployment:

* Connect to Your EC2 Instance:
Open MobaXterm and establish an SSH connection to your EC2 instance. Enter the necessary details such as hostname/IP address, username, and password or SSH key.
* Install Java:
```
 sudo yum install java-17* -y
```
* Install Java:
```
 sudo yum install maven -y
```
* Install Tomcat:
```
 wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.89/bin/apache-tomcat-9.0.89.tar.gz
```
* Untar:
```
 tar -xvzf apache-tomcat-9.0.89.tar.gz
```
* Navigate to the Directory Containing the WAR File:
Once connected, navigate to the directory on your local machine where the WAR file is located using the file browser in MobaXterm.
* Transfer the WAR File to Your EC2 Instance:
Select the WAR file in the local file browser.
Right-click on the selected file and choose "Upload to..." from the context menu.
In the dialog that appears, specify the destination directory on your EC2 instance where you want to upload the WAR file. This could be a directory where Tomcat expects WAR files, typically the webapps/ directory.
* Monitor the File Transfer: MobaXterm will transfer the WAR file to your EC2 instance. You can monitor the progress in the file transfer dialog.
* SSH into Your EC2 Instance: Once the file transfer is complete, switch to the SSH session tab in MobaXterm or open a new SSH session if needed to connect to your EC2 instance.
* Deploy the WAR File to Tomcat: Follow the steps mentioned earlier to deploy the WAR file to Tomcat on your EC2 instance. This typically involves copying the WAR file to the webapps/ directory of Tomcat.
* Access Your Application: After the deployment is successful, you can access your application using a web browser by navigating to the appropriate URL.
`http://tomcatpublicipaddress:8080/index.jsp`
* Username- meghana
* Password- meghana123
After successful login you will get redirect to other page with the URL `http://tomcatpublicipaddress:8080/dashboard.jsp`

# Setting Up and Running a Maven Build on an EC2 Instance from a Git Repository 

* Connect to Your EC2 Instance:
Open MobaXterm and establish an SSH connection to your EC2 instance. Enter the necessary details such as hostname/IP address, username, and password or SSH key.
# Install Java: 
```
 sudo yum install java-17* -y
```
# Install Maven:
```
 sudo yum install maven -y
```
# Install Git:
```
 sudo yum install git -y
```
# Install Tomcat:
```
 wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.89/bin/apache-tomcat-9.0.89.tar.gz
```
```
 tar -xvzf apache-tomcat-9.0.80
```
# Clone Your Project from Git
* Navigate to the Desired Directory: 
`cd /home/ec2-user`
* Clone the Git Repository:
```
 git clone https://github.com/meghanakoturi/LOGIN-POC.git
```
```
 cd login
```
# Build Your Project with Maven:
`mvn clean`- Run Maven Clean
`mvn clean package`- Run Maven Clean Package
# Deploy the WAR File to Tomcat 
* Copy the WAR File to Tomcat's Webapps Directory: `sudo cp /home/ec2-user/LOGIN-POC/Login/target/login.war /home/ec2-user/apache-tomcat-9.0.89/webapps/`
* Move the login.war to ROOT.war in webapps `mv Login.war ROOT.war`
* Start Tomcat: If Tomcat is not already running, start it with `sudo /home/ec2-user/apache-tomcat-9.0.89/bin/startup.sh`
* We can access the database from the above steps that are `MySQL Installation` `MySQL Configuration`.
* * Access Your Application: After the deployment is successful, you can access your application using a web browser by navigating to the appropriate URL.
`http://tomcatpublicipaddress:8080/index.jsp`
* Username- meghana
* Password- meghana123
After successful login you will get redirect to other page with the URL `http://tomcatpublicipaddress:8080/dashboard.jsp`

# Testing:

* Login Functionality Testing:
Verify that the login form is displayed correctly on the index.jsp page.
* Test various scenarios:
Try logging in with valid credentials.
Attempt logging in with an invalid username or password.
Test for edge cases such as empty username or password fields.
Ensure that appropriate error messages are displayed for invalid login attempts.
Validate that users are redirected to the dashboard (dashboard.jsp) upon successful login.
* Database Connectivity Testing:
Ensure that the application can establish a connection to the MySQL database running on your EC2 instance.
Test database interactions by verifying that user credentials are correctly validated against the database.
Confirm that appropriate error handling is in place for database connection failures or SQL errors.
* Dashboard Display Testing:
Access the dashboard (dashboard.jsp) after successful login.
Validate that the dashboard page displays relevant user information or application data.
Test any interactive elements or functionality on the dashboard, such as navigation links or buttons.
Verify that the dashboard layout and styling appear as expected across different devices and screen sizes.
* End-to-End Testing:
Perform end-to-end testing by simulating user journeys through your application.
Test common user workflows, such as logging in, accessing different pages, and performing actions within the application.
Verify that session management works correctly, ensuring that users remain authenticated during their session and are logged out after a period of inactivity or upon logging out manually.
* Cross-Browser and Cross-Device Testing:
Test your application across different web browsers (e.g., Chrome, Firefox, Safari) and devices (desktop, tablet, mobile) to ensure compatibility and responsiveness.
Pay attention to any layout issues, UI discrepancies, or functionality gaps that may arise on specific browsers or devices.

# Challenges Faced:

* Setting up MySQL on EC2:
Initially, configuring MySQL on the EC2 instance posed challenges, including installation, setup, and database creation.
Managing database security and user permissions required additional attention.
Integrating MySQL with the Application:
* Connecting the Java application to MySQL and ensuring smooth data interaction presented challenges, especially with JDBC configuration and handling database exceptions.
* Deployment Process:
Deploying the WAR file to Tomcat on the EC2 instance was initially unfamiliar, leading to errors in file transfer and deployment.
Ensuring the WAR file was placed in the correct directory and configuring Tomcat to recognize and deploy it properly were hurdles.
Strategies Employed:
* Research and Documentation:
Thorough research on setting up MySQL on EC2 was conducted, leveraging official documentation, tutorials, and community forums.
Detailed documentation of each step, including MySQL installation, configuration, and user management, was maintained for reference.
Testing and Debugging:
* Extensive testing of JDBC connections and SQL queries was performed locally to ensure smooth integration with MySQL.
Robust error handling and logging mechanisms were implemented in the application code to identify and debug database-related issues.
* Automating Deployment:
Scripts were developed to automate the deployment process, including transferring the WAR file to the EC2 instance and restarting the Tomcat server.
Continuous integration and deployment (CI/CD) pipelines were explored to streamline the deployment workflow and ensure consistency.
* Collaboration and Support:
Collaborating with team members and seeking support from peers and online communities helped address specific challenges encountered during the development and deployment phases.
Utilizing AWS support resources and documentation for EC2 and Tomcat troubleshooting proved beneficial in resolving deployment-related issues.

# Conclusion:

In this project, we successfully developed a web application with login functionality using a three-tier architecture. The application allowed users to log in securely and access a dashboard page based on their credentials. We utilized Java for backend logic, JSP for frontend presentation, and MySQL for database management.

Through this project, we learned valuable skills in setting up and configuring MySQL on an EC2 instance, integrating MySQL with a Java web application, and deploying the application to Tomcat on the EC2 instance. We gained insights into database connectivity, error handling, and deployment automation.

Overall, this project provided hands-on experience in building and deploying a web application in a real-world environment, furthering our understanding of software development and deployment processes. We look forward to applying these skills in future projects and continuing to expand our knowledge in web development and cloud computing.

    




