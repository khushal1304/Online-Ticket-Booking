# Online Movie Ticket Booking System

An enterprise-style web application built from scratch using Java Servlets, JSP, and MySQL. This project simulates a real-world movie ticket booking platform where users can register, log in, browse currently showing movies, and book tickets. The application follows the MVC (Model-View-Controller) architectural pattern.

## Features

* **User Authentication:** Secure user registration and login system.
* **Password Security:** Passwords are securely hashed using the **jBCrypt** library before being stored in the database.
* **Movie Dashboard:** A dynamic dashboard that fetches and displays a list of currently showing movies from the database.
* **Ticket Booking:** Users can select a showtime and the number of tickets to book for any movie.
* **Booking Confirmation:** A dedicated confirmation page displays the booking summary after a successful transaction.
* **Session Management:** The application correctly manages user sessions, ensuring that only logged-in users can access protected pages like the dashboard.
* **Legal Pages:** Includes standard Terms & Conditions and Privacy Policy pages.

## Technology Stack

* **Backend:** Java (Servlets API)
* **Frontend:** JavaServer Pages (JSP), HTML
* **Styling:** Tailwind CSS (via CDN)
* **Database:** MySQL
* **Web Server:** Apache Tomcat
* **Build Tool/IDE:** Eclipse IDE for Enterprise Java and Web Developers
* **Libraries:**
    * MySQL Connector/J (JDBC Driver)
    * jBCrypt (for password hashing)

## Setup and Installation

To run this project locally, follow these steps:

1. Prerequisites
* Java Development Kit (JDK) 8 or higher
* Eclipse IDE for Enterprise Java and Web Developers
* Apache Tomcat 9 (or a version compatible with `javax.servlet`)
* MySQL Server & MySQL Workbench

2. Database Setup
a.  Open MySQL Workbench and create a new database schema named `ticketbooking_db`.
b.  Execute the SQL script located in `database_setup.sql` (or copy it from the project files) to create the necessary tables (`users`, `movies`, `bookings`) and populate the `movies` table with sample data.

3. Project Setup
a.  Clone the repository: `git clone https://github.com/your-username/your-repo-name.git`
b.  Open Eclipse and import the project: `File -> Import -> General -> Existing Projects into Workspace`. Select the cloned repository folder.
c.  Add the required JAR files (`mysql-connector-j-x.x.x.jar`, `jbcrypt-0.4.jar`) to the `src/main/webapp/WEB-INF/lib` directory if they are not already present.
d.  Configure the Target Runtime in Eclipse to point to your Apache Tomcat server installation.

4. Configuration
a.  Open the `src/main/java/com/booking/util/DBConnection.java` file.
b.  Update the `USER` and `PASSWORD` constants with your MySQL username and password.

    ```java
    private static final String USER = "your_mysql_username";
    private static final String PASSWORD = "your_mysql_password";
    ```

5. Run the Application
a.  Right-click on the project in Eclipse.
b.  Select `Run As -> Run on Server`.
c.  Choose your configured Tomcat server. Eclipse will start the server and open the application in a web browser.

Future Enhancements
* Admin Panel: A secure dashboard for administrators to add/edit/delete movies.
* Seat Selection: Implement a visual seat map for users to select specific seats.
* User Profile: A page for users to view their booking history.
* DAO Pattern: Refactor the database logic from Servlets into a dedicated DAO (Data Access Object) layer for better code organization.
