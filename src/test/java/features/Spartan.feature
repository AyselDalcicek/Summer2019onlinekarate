@spartan
Feature: practice with spartan app

  Background: setup
    * url 'http://54.84.182.239:8000'

    Scenario: Get all spartans
    Given path '/api/spartans'
    When method get
    Then status 200
    And print response[0]

  Scenario: Add new spartan and verify status code 201
    Given path '/api/spartans'
    * def spartan =
      """
    {"name": "Aysel",
    "gender": "Female",
    "phone": 12023615000
    }
      """
    * request spartan
    When method post
    Then status 201

    @delete_spartan
  Scenario: Delete spartan
    Given path '/api/spartans/150'
    When method delete
    Then status 204
    * print response

      @add_spartan_with_external_json
    Scenario: Add new spartan by reading external JSON payload
      Given path '/api/spartans'
      * def spartan = read('../test_data/payloads/spartan.json')
      * request spartan
      When method post
      Then status 201
        Then assert response.success == 'A Spartan is Born!'
      * print response


        #    PATCH - partial update of existing entity (object)

      @patch_spartan
      Scenario: Patch existing spartan
        Given path '/api/spartans/147'
        And request {name:'Bera Dalcicek'}
        When method patch
        Then print response
        And status 204

      @update_spartan
      Scenario: Update existing spartan
        Given path '/api/spartans/123'
        And request {name:'Zeynep Dalcicek', gender: 'Female', phone:'1234567890'}
        When method put
        Then print response
        And status 204

