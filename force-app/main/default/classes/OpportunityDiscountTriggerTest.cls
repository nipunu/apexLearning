@IsTest
public with sharing class OpportunityDiscountTriggerTest {
    @isTest
    static void testDiscountApplication() {
        // Create an opportunity with a high amount
        Opportunity opp = new Opportunity(Name = 'Test Deal', Amount = 100000, StageName = 'Prospecting', CloseDate = Date.today().addDays(15));
        insert opp;
        
        // Retrieve the inserted record
        Opportunity insertedOpp = [SELECT Discount__c FROM Opportunity WHERE Id = :opp.Id];

        // Assert that the discount is correctly applied
        System.assertEquals(10000, insertedOpp.Discount__c);
    }

}