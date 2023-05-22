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
  docker-compose up

3. The application will be available at http://localhost:3000.

## Running without Docker

To run the application without Docker, follow these steps:

1. Make sure you have the following dependencies installed on your system:
   - Ruby 2.7.1
   - PostgreSQL 12

2. Install the required gems by running the following command:

   ```bash
   bundle install

3. Set up the PostgreSQL database with the following configuration:

  Username: motosmart
  Password: emnetartnoc
  Database: motosmart

4. Run the database migrations:
  rails db:migrate

5. Run the database seed:
  rails db:seed

6. Start the application server:
  rails server

7. Access the application by navigating to http://localhost:3000 in your web browser.


## Note on UUID Generation and PostgreSQL Version

Please note that this project deviates from the conventional UUID generation method due to the use of PostgreSQL version 12. The `gen_random_uuid()` function, recommended for UUID generation, is not available in this version. As a result, an alternative method has been employed to generate UUIDs in this project, ensuring compatibility with PostgreSQL 12.

If you are running PostgreSQL version 13 or higher, you can take advantage of the `gen_random_uuid()` function for UUID generation. However, please be aware that this project is specifically designed to work with PostgreSQL version 12, based on the requirements and specifications provided by Motosmart.