# README 

# Problem Idendification & Reasons
* Owning a motorcycle can be quite costly to maintain and upgrade components. Currently, service and upgrade costs are relatively high due to limited repair shops. 
* During Covid-19 pandemic, there is a great number of mechanics losing their jobs and wanting to work from home, or run their own local business. 
* Bikes dealers could charge expensive fees for motorbike owners for simple tasks like oil change, wheel alignment, part installation.
* Currently, there are no place to connect demands of regular motorbike users and local mechanics who are qualified to do basic tasks with a much more affordable price and personalized recommendation

# [Link to Heroku](https://johnny-uniq-e.herokuapp.com/)

# [Link to Github](https://github.com/nddung2812/two-sided_marketplace_motorbikeshop)
# [Link to Trello board](https://trello.com/b/63ihniQI/marketplace-app)

# Setup - Local Server
1. Clone the repository

    `git clone git@github.com:nddung2812/two-sided_marketplace_motorbikeshop.git`
2. Update yarn configuration

    `yarn install --check-files`
3. Make sure Ruby 3.0.0 and Rails 6.1.4 are installed

4. Setup Postgresql server

    `rails db:setup`

    `rails db:migrate`

    `rails db:seed`

5. Setup Stripe Credentials, reset master key 
- Delete exisiting credentials.yml.enc
- Run `EDITOR="mate --wait" rails credentials:edit`
- And then `EDITOR="code --wait" rails credentials:edit` to enter stripe and AWS details
- Refer to https://stripe.com/en-au and https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/

6. Run local server with this command

    `rails s`

7. Use https://localhost:3000/ to load the website

# Description of Uniq-E
## Purpose of Uniq-E application
* Connecting and allowing buyers, service users and sellers or service providers
* A free market where bikes owners can find better solutions to maintain, upgrade their vehicles with the support of local mechanics
* Reduce fee, time
* Create more jobs for local businesses
* Allow users to find the best services and bikes available in the market within the nearest locations
## Functionality / Features
* Users must sign up and sign in in order to use the application, when signing in, sign out button will appear and sign button will disappear and vice versa with when signing out
* Standard users are restricted with edit and delete functions
* Admin user name : admin@test.com 
* Admin user password: 123456
* Once users sign up, they can start uploading their posts, services including a photo, name, description, price and other details. 
* After 10 mins of inactivity, the current user will be automatically logged out
* Admin users can have the access to edit, delete posts
* Users can edit their profile, change passwords and details
* Users can pay through the app using Stripe payment gateway

## Site map
![Site Map](app/assets/images/Sitemap.png)
## Screenshots

![ New Post Page ](app/assets/images/SS1.png)

![Home Page](app/assets/images/SS2.png)

![Item Page](app/assets/images/SS3.png)

![Show Page](app/assets/images/SS4.png)

![Show/post:id Page](app/assets/images/SS5.png)

![Edit profile Page](app/assets/images/SS6.png)

![New Service Page](app/assets/images/SS7.png)

![Stripe Payment Page](app/assets/images/SS8.png)

![Confirmation Page](app/assets/images/SS9.png)

## Target audience
* Motorcyle owners
* Local mechanics
* Parts and service users and providers
## Tech stack
* Prgramming languages
    1. HTML5
    2. SCSS & CSS
    3. JavaScript
    4. Ruby
* Framework
    1. Ruby on Rails
* Server
    1. Localhost servers
    2. Postgresql
* Deployment platform
    1. Heroku
    2. Digital Ocean
* Cloud storage
    1. AWS S3
# User story
## As a Buyer
1. I want to be able to create edit my account
2. I need to see listings and products or services which are available
3. I need to search for key word and compare the prices of all providers
## As a Seller
1. I want to be able to post my products and services
2. I want to provide job, item name, description, services, price, photos and location
3. I want to receive payment from the buyers on the application
4. I also want to be able to create, login and out, edit my account
## Authenticating and Authorization 
1. I do not want other people to access to my account.
2. Standard users are not allowed to edit and delete posts
# Wireframes
![Home Page](app/assets/images/WF1.png)

![Signup Page](app/assets/images/WF2.png)

![Signin Page](app/assets/images/WF3.png)

![Edit profile Page](app/assets/images/WF4.png)

![Single product Page](app/assets/images/WF6.png)

![Post listingm Page](app/assets/images/WF7.png)

![Show Page](app/assets/images/WF8.png)

![Confirmation Page](app/assets/images/WF9.png)
# ERD tables

![Initial ERD](app/assets/images/Initial_ERD.png)

Reason to finalized ERD tables
1. Adding AWS image_id for blobs and attachments
2. Changed Listing name to Post

![Final ERD](app/assets/images/Final_ERD.png)

# Third party services
1. Fontawesome - to add icons on the website
2. Bootstrap 5 - to style and customize Front-End interaction
3. Devise Gem - to create user accounts with authencation
4. Ransack Gem - to implement search functions
5. Heroku - a cloud platfrom allow developers to deploy their application supporting a wide range of languages including ruby and PostgreSQL server
6. Stripe - this is an online payment gateway that allows users to make payment online with low transaction fees
7. Ultrahook gem - using a public webhook enpoint to track realtime information from Stripe. 
# Database models and relationships
## User 
- has many orders
- has one user_name
- has many services

## User_name
- belongs to user
## User_contact
- belong to user_id
- has one user_address
## User_address
- belong to address_id
- belong to one state
## State
- can have many postcode_id
## Order
- belong to user
- has many posts
## Post
- belong to order
- has one image_id
- has one model
- has one make
## Services
- belong to user
- has one image_id
- has one model
- has one make
## Make
- has one make_id
- belongs to services
- belongs to post
## Model
- has one model_id
- belongs to services
- belongs to post
## AWS_blobs
- belongs to post
- belongs to services
- has one image_id
## AWS_attachment
- has one blob_id
- belongs to AWS_blobs
# Data schema design

```ActiveRecord::Schema.define(version: 2021_08_10_032859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "listings", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "price"
    t.bigint "make_id"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["make_id"], name: "index_listings_on_make_id"
    t.index ["user_id"], name: "index_listings_on_user_id"
  end

  create_table "makes", force: :cascade do |t|
    t.string "name"
    t.text "desscription"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "models", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "User"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_models_on_email", unique: true
    t.index ["reset_password_token"], name: "index_models_on_reset_password_token", unique: true
  end

  create_table "posts", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "price"
    t.boolean "used_vehicle"
    t.string "make"
    t.string "model"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "job"
    t.text "description"
    t.float "price"
    t.string "model"
    t.string "make"
    t.boolean "major_service"
    t.string "address"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_services_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "listings", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "services", "users"
end
```
# Task Allocation
I am using Trello to manage this project in terms of requirements, debugging and time management. Each card is colored due to their priority and moved to appropriate columns depending on the status.

![Trello Board](app/assets/images/T1.png)

![Checklist Page](app/assets/images/T2.png)