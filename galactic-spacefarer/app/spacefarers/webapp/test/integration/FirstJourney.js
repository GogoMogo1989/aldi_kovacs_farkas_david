sap.ui.define([
    "sap/ui/test/opaQunit",
    "./pages/JourneyRunner"
], function (opaTest, runner) {
    "use strict";

    function journey() {
        QUnit.module("First journey");

        opaTest("Start application", function (Given, When, Then) {
            Given.iStartMyApp();

            Then.onTheSpacefarersList.iSeeThisPage();
            Then.onTheSpacefarersList.onFilterBar().iCheckFilterField("First Name");
            Then.onTheSpacefarersList.onFilterBar().iCheckFilterField("Last Name");
            Then.onTheSpacefarersList.onFilterBar().iCheckFilterField("Origin Planet");
            Then.onTheSpacefarersList.onTable().iCheckColumns(9, {"firstName":{"header":"First Name"},"lastName":{"header":"Last Name"},"email":{"header":"Email"},"originPlanet":{"header":"Origin Planet"},"stardustCollection":{"header":"Stardust Collection"},"wormholeNavigationSkill":{"header":"Wormhole Navigation Skill"},"spacesuitColor":{"header":"Spacesuit Color"},"departmentName":{"header":"Department"},"positionTitle":{"header":"Position"}});

        });


        opaTest("Navigate to ObjectPage", function (Given, When, Then) {
            // Note: this test will fail if the ListReport page doesn't show any data
            
            When.onTheSpacefarersList.onFilterBar().iExecuteSearch();
            
            Then.onTheSpacefarersList.onTable().iCheckRows();

            When.onTheSpacefarersList.onTable().iPressRow(0);
            Then.onTheSpacefarersObjectPage.iSeeThisPage();

        });

        opaTest("Teardown", function (Given, When, Then) { 
            // Cleanup
            Given.iTearDownMyApp();
        });
    }

    runner.run([journey]);
});