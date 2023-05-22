# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## Note on UUID Generation and PostgreSQL Version

Please note that this project deviates from the conventional UUID generation method due to the use of PostgreSQL version 12. The `gen_random_uuid()` function, recommended for UUID generation, is not available in this version. As a result, an alternative method has been employed to generate UUIDs in this project, ensuring compatibility with PostgreSQL 12.

If you are running PostgreSQL version 13 or higher, you can take advantage of the `gen_random_uuid()` function for UUID generation. However, please be aware that this project is specifically designed to work with PostgreSQL version 12, based on the requirements and specifications provided by Motosmart.