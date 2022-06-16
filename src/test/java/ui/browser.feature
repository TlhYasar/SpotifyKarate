
Feature: Spotify UI Test
  Background:
    * def URL = 'https://open.spotify.com/'
    * def username = 'Kullanıcı Adınızı Giriniz.'
    * def password = 'Şifrenizi Giriniz.'
    * def renamePlaylist = 'MentorLabs Challenge'
    * def search = 'Daft Punk'

  Scenario: Login, create playlist, search and add song to playlist
    Given driver URL
    * maximize()
    And waitFor("//div[@class='ButtonInner-sc-14ud5tc-0 iebPZv encore-inverted-light-set']").click()

    #Login Page
    * input('#login-username', username)
    * input('#login-password', password)
    * click('.ButtonInner-sc-14ud5tc-0.lbsIMA.encore-bright-accent-set')

    #Create New Playlist
    * waitFor('.IPVjkkhh06nan7aZK7Bx').click()
    * click(".AINMAUImkAYJd4ertQxy")
    * waitFor('.o4KVKZmeHsoRZ2Ltl078').click()

    #Rename Playlist
    * input('.RLzMolC7kIdp65LyfQPb', renamePlaylist)
    * click('.Button-qlcn5g-0.jvEinx')

    #Search and Add First Song
    * input('.Type__TypeElement-goli3j-0.ebHsEf.l42JW4EP_5CU1Ba7jYIc', search)
    * scroll('.gkgL9fB_pyDL75m9HKdu')
    * waitFor("//button[@class='Button-y0gtbx-0 jjUWAm']").parent.firstChild.click()
    * delay(1000)



