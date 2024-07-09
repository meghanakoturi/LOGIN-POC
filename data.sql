-- Create table 'login'
CREATE TABLE login (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  password VARCHAR(255) NOT NULL
);

-- Create table 'user'
CREATE TABLE user (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  password VARCHAR(255) NOT NULL
);

-- Insert initial data into 'login' table
INSERT INTO login (username, password)
VALUES ('meghana', 'meghana123');

-- Insert initial data into 'user' table
INSERT INTO user (username, password)
VALUES ('localhost', 'Localhost@123');
