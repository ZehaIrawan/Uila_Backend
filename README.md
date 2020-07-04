# UILA! Backend

## API for Uila! Client & Uila! CMS
* Users can signup and upgrade their role to admin if they have the correct upgrade codes.
* Uses JWT token for authentication.
* Admin can post a product, optionally upload an image to cloudinary integration.
* Users can add product to cart.


## Getting started


```
$ bundle install
```
Create your own master.key, if you are using VS Code, you can use
```
EDITOR='code --wait' rails credentials:edit
```
With the following content

```
upgrade_key: your_own_upgrade_key

cloudinary:
  cloud_name: your_cloud_name
  api_key: your_cloudinary_api_key
  api_secret: your_cloudinary_api_secret
```


```
$ rails db:migrate
```
```
$ rails server
```

## Authors

* **Zeha Irawan** - [Jangkarbumi](https://github.com/JangkarBumi)
