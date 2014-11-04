Feature: Zato kvdb data dict dictionary edit

    Scenario: Set up

        Given I store "System" under "test_system"
        Given I store "Key" under "test_key"
        Given I store "Value" under "test_value"

        Given I store "Edited_system" under "edited_test_system"
        Given I store "Edited_key" under "edited_test_key"
        Given I store "Edited_value" under "edited_test_value"

    Scenario: Create a test data dictionary entry in a cluster's KVDB

        Given address "@test_server"
        Given URL path "/zato/json/zato.kvdb.data-dict.dictionary.create"
        Given Basic Auth "@pubapi_user" "@pubapi_password"
        Given format "JSON"
        Given request is "{}"
        Given JSON Pointer "/system" in request is "#test_system"
        Given JSON Pointer "/key" in request is "#test_key"
        Given JSON Pointer "/value" in request is "#test_value"

        When the URL is invoked

        Then JSON Pointer "/zato_env/result" is "ZATO_OK"
        And I store "/zato_kvdb_data_dict_dictionary_create_response/id" from response under "test_dictionary_entry_id"

    Scenario: Check if test dictionary entry actually exists

        Given address "@test_server"
        Given URL path "/zato/json/zato.kvdb.data-dict.dictionary.get-last-id"
        Given format "JSON"

        When the URL is invoked

        Then JSON Pointer "/zato_env/result" is "ZATO_OK"
        And JSON Pointer "/zato_kvdb_data_dict_dictionary_get_last_id_response/value" is "#test_dictionary_entry_id"

    Scenario: Edit test entry

        Given address "@test_server"
        Given URL path "/zato/json/zato.kvdb.data-dict.dictionary.edit"
        Given format "JSON"
        Given request is "{}"
        Given JSON Pointer "/id" in request is "#test_dictionary_entry_id"
        Given JSON Pointer "/system" in request is "#edited_test_system"
        Given JSON Pointer "/key" in request is "#edited_test_key"
        Given JSON Pointer "/value" in request is "#edited_test_value"

        When the URL is invoked

        Then JSON Pointer "/zato_env/result" is "ZATO_OK"
        And JSON Pointer "/zato_kvdb_data_dict_dictionary_edit_response/id" is an integer "#test_dictionary_entry_id"
