# Ruby version
- 2.6.2

# App purpose
- Consume the Overwatch API to build endpoints
# How to test APIs
- Clone the repository
- Run `bundle`
- Start local server `rails s`
- Visit `localhost:3000`
Docker is not running due to some version compatibitly iussues


# Endpoints
````
1. Request: GET  /api/heros
Optional params: page(Default: 1) and limit(Default: 50)
Response: {
  "data": [
    {
      "id": "1",
      "type": "heros",
      "attributes": {
        "overwatch-id": 4,
        "name": "Genji",
        "real-name": "Genji Shimada",
        "health": 200,
        "armour": 0,
        "shield": 0
      }
    },
    {
      "id": "2",
      "type": "heros",
      "attributes": {
        "overwatch-id": 1,
        "name": "Ana",
        "real-name": "Ana Amari",
        "health": 200,
        "armour": 0,
        "shield": 0
      }
    },... ]

2. GET api/heros/:id
{
  "data": {
    "id": "2",
    "type": "heros",
    "attributes": {
      "overwatch-id": 1,
      "name": "Ana",
      "real-name": "Ana Amari",
      "health": 200,
      "armour": 0,
      "shield": 0
    }
  }
}

3. GET api/heros/:hero_id/abilities
{
  "data": [
    {
      "id": "22",
      "type": "abilities",
      "attributes": {
        "overwatch-id": 22,
        "name": "Storm Bow",
        "description": "Hanzo nocks and fires an arrow at his target.",
        "is-ultimate": false
      }
    },... ]

4. GET api/abilities
Optional params: page(Default: 1) and limit(Default: 50)
{
  "data": [
    {
      "id": "1",
      "type": "abilities",
      "attributes": {
        "overwatch-id": 17,
        "name": "Shuriken",
        "description": "Genji looses three deadly throwing stars in quick succession. Alternatively, he can throw three shuriken in a wider spread.",
        "is-ultimate": false
      }
    },... ]
    
5. GET api/abilities/:id
  "data": {
    "id": "7",
    "type": "abilities",
    "attributes": {
      "overwatch-id": 2,
      "name": "Sleep Dart",
      "description": "Ana fires a dart from her sidearm, rendering an enemy unconscious (though any damage will rouse them).",
      "is-ultimate": false
    }
  }
````


# External Gems used
- **rspec-rails, factory_bot_rails:, faker:** Unit testing
- **active_model_serializers:** Serialize the output
- **httparty:** REST-API client
- **kaminari:** Pagination
