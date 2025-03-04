trigger OpportunityDiscountTrigger on Opportunity (before insert, before update) {

    for(Opportunity opp : Trigger.new){
        if(opp.Amount > 50000){
            opp.Discount__c = opp.Amount * 0.10; // Apply 10% discount
            System.debug("Discount Applied: " + opp.Discount__c); 
        }
        else{
            opp.Discount__c = 0; // No discount for lower amounts
            System.debug("No Discount Applied: ");
        }
    }

}