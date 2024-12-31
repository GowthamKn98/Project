public with sharing class OrderController {
    @AuraEnabled(cacheable=true)
    public static List<Orderr__c> getOrders() {
        return [SELECT Id, Order_Number__c, Order_Date__c, Total_Amount__c FROM Orderr__c];
    }
}