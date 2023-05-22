# MotoSmart Application

## Versions

- System version: Debian 12
- Ruby version: 2.7.1
- Rails version: 5.2.8.1
- PostgreSQL version: 12

## Getting Started

To get started with the MotoSmart application, follow the steps below:

## Running with Docker

Make sure you have Docker installed on your system. You can follow these steps to run the application with Docker:

1. Access the application directory:

   ```bash
   cd <APP_DIRECTORY_NAME>

2. Run the following command to build the images and start the containers:
   ```bash
   docker-compose up -d

3. The application will be available at http://localhost:3000.

## Running without Docker

To run the application without Docker, follow these steps:

1. Make sure you have the following dependencies installed on your system:
   - Ruby 2.7.1
   - PostgreSQL 12

2. Install the required gems by running the following command:

   ```bash
   bundle install

3. Set up the .env file by copying the .env.example file and replacing the values with your own:

   ```bash
   cp .env.example .env

4. Run the database migrations:
  rails db:migrate

5. Run the database seed:
  rails db:seed

6. Start the application server:
  rails server

7. Access the application by navigating to http://localhost:3000 in your web browser.

## Note for Postman Users
For users of Postman, a Postman collection file named "MotoSmart.postman_collection.json" is available in the project repository. This file contains preconfigured API requests that you can import into your Postman application to interact with the MotoSmart API more conveniently. Feel free to utilize this collection to streamline your API testing and usage.

## Routes
The MotoSmart application provides the following main routes:

**Users**
Endpoint: http://localhost:3000/api/v1/users
 
 GET: Retrieve the list of all users.
  >Requires: UUID and Token headers for user validation.
 
 POST: Create a new user.
  >Does not require user validation.
  >Needs "name", "email", "password".

**Rankings**
Endpoint: http://localhost:3000/api/v1/rankings

 GET (/actual): Retrieve the total ranking of all users.
 >Requires: UUID and Token headers for user validation.
 
 GET (/:year/:month): Retrieve the ranking for a specific month.
  >Requires: UUID and Token headers for user validation.

**Records**
Endpoint: http://localhost:3000/api/v1/users/:user_id/records

 POST: Create a new record for the specified user.
  >Requires: UUID and Token headers for user validation.
  >Needs "distance"

## Note on UUID Generation and PostgreSQL Version

Please note that this project deviates from the conventional UUID generation method due to the use of PostgreSQL version 12. The `gen_random_uuid()` function, recommended for UUID generation, is not available in this version. As a result, an alternative method has been employed to generate UUIDs in this project, ensuring compatibility with PostgreSQL 12.

If you are running PostgreSQL version 13 or higher, you can take advantage of the `gen_random_uuid()` function for UUID generation. However, please be aware that this project is specifically designed to work with PostgreSQL version 12, based on the requirements and specifications provided by Motosmart.
