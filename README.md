# SQL-Scripts-for-Biological-Weapons-Database
☣This repository contains SQL scripts for creating and manipulating a database of biological weapons.

The database includes information about the types of biological weapons, their history, and their effects.

### Installation

    
1.  Create a new database and user:
    
    CREATE DATABASE bio_weapons;
    CREATE USER 'bio_weapons_user'@'localhost' IDENTIFIED BY 'password';
    GRANT ALL PRIVILEGES ON bio_weapons.* TO 'bio_weapons_user'@'localhost';
    
2.  Import the SQL scripts into the database:
    
    cssCopy code
    
    `mysql -u bio_weapons_user -p bio_weapons < create_tables.sql
    mysql -u bio_weapons_user -p bio_weapons < insert_data.sql` 
    

### 🤔Usage

The following scripts can be used to interact with the database:

-   `select_weapons.sql`: Returns information about all biological weapons in the database.
    
-   `select_countries.sql`: Returns information about all countries that have developed or used biological weapons.
    
-   `select_effects.sql`: Returns information about the effects of biological weapons.
    
-   `select_history.sql`: Returns a brief history of biological weapons.
    
-   `insert_weapon.sql`: Adds a new biological weapon to the database.
    
-   `insert_country.sql`: Adds a new country that has developed or used biological weapons.
    
-   `insert_effect.sql`: Adds a new effect of biological weapons to the database.
    
-   `update_weapon.sql`: Updates information about an existing biological weapon.
    
-   `update_country.sql`: Updates information about an existing country that has developed or used biological weapons.
    
-   `update_effect.sql`: Updates information about an existing effect of biological weapons.
    
-   `delete_weapon.sql`: Deletes information about an existing biological weapon.
    
-   `delete_country.sql`: Deletes information about an existing country that has developed or used biological weapons.
    
-   `delete_effect.sql`: Deletes information about an existing effect of biological weapons.
    
