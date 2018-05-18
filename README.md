# README
  Save data from chatfuel json api

## Ruby version

    ruby '2.5.1'

## Rails version

    gem 'rails', '~> 5.2.0'

## No Model (Database)
  file all saved in /storage/.

## APIs
### GET /event-key
  get a hex code from server

### POST /save-data/:event_key
  put this string in your chatfuel json api url

### GET /download-data/:event_key
  download the newest report while you need
