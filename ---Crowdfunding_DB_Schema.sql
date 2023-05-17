---Crowdfunding_DB_Schema

CREATE DATABASE crowdfunding_db;

DROP TABLE IF EXISTS campaigns CASCADE;
DROP TABLE IF EXISTS contacts CASCADE;
DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS subcategories CASCADE;

CREATE TABLE categories (
  category_id     INT NOT NULL UNIQUE,  
  category_name   TEXT,
  PRIMARY KEY (category_id)
);

CREATE TABLE subcategories (
  subcategory_id  INT NOT NULL UNIQUE,  
  subcategory_name TEXT,
  PRIMARY KEY (subcategory_id)
);


CREATE TABLE campaigns (
  cf_id           INT,
  contact_id      INT NOT NULL UNIQUE,
  company_name    TEXT,
  description     TEXT,
  goal            REAL,
  pledged         REAL,
  outcome         TEXT,
  backers_count   INT,
  country         TEXT,
  currency        TEXT,
  launch_date     TIMESTAMP,
  end_date        TIMESTAMP,
  category_id     INT NOT NULL references categories(category_id) ON DELETE CASCADE,  
  subcategory_id  INT NOT NULL references subcategories(subcategory_id) ON DELETE CASCADE,  
  PRIMARY KEY (cf_id)
);

CREATE TABLE contacts (
  contact_id      INT NOT NULL references campaigns(contact_id) ON DELETE CASCADE,
  contact_first  VARCHAR(255),
  contact_last   VARCHAR(255),
  contact_email   TEXT,
  PRIMARY KEY (contact_id)
);

