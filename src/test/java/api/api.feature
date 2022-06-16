
Feature: Spotify Api Test

  Background:
    * url 'https://api.spotify.com/v1'
    * def userId = 'UserID Giriniz.'
    * def myToken = 'Token Giriniz.'

  Scenario: Create playlist, search and add song to playlist
    * def requestList =
	"""
	{
      "name": "MentorLabs",
      "description": "Api Testing",
      "public": true
    }
 """
    * header Authorization = 'Bearer ' +myToken
    Given path '/users/' +userId+ '/playlists'
    And request requestList
    When method POST
    Then status 201

    And def playlistId = response.id
    * print playlistId
    * header Authorization = 'Bearer ' +myToken

    Given path '/search'
    And param q = 'Bohemian Rhapsody'
    And param type = 'track'
    When method GET

    And def URI = response.tracks.items[0].uri
    * header Authorization = 'Bearer ' +myToken

    Given path '/playlists/' +playlistId+ '/tracks'
    * def requestBody = {uris:[#(URI)]}
    And request requestBody
    When method POST


